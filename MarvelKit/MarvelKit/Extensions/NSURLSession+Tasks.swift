//
//  NSURLSession+Tasks.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public enum MarvelKitError: Swift.Error {

    case JSONObjectConvertibleError(msg: String)
    case JSONSerializationError(msg: String)
    case URLSessionError(msg: String)
    case URLError(msg: String)

}

public extension MarvelKitError {

    var description: String {
        switch self {
            case let .JSONObjectConvertibleError(msg):
                return msg
            case let .JSONSerializationError(msg):
                return msg
            case let .URLSessionError(msg):
                return msg
            case let .URLError(msg):
                return msg
        }
    }

}

public extension URLSession {
    
    public func failingTask(_ errorHandler: @escaping (MarvelKitError) -> Void) -> URLSessionTask {
        return URLSession.shared.dataTask(with: URL(fileURLWithPath: "")) { _ in
            errorHandler(.URLError(msg: "Failed to create URL for resource"))
        }
    }

    public func dataTaskWithURL(_ url: URL, successHandler: @escaping (URLResponse?, Data) -> Void, errorHandler: @escaping (URLResponse?, MarvelKitError) -> Void) -> URLSessionDataTask {
        return dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                return errorHandler(response, .URLSessionError(msg: error.localizedDescription))
            } else if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    if let data = data {
                        return successHandler(response, data)
                    } else {
                        return errorHandler(response, .URLSessionError(msg: "Failed to receive data"))
                    }
                } else {
                    if let data = data,
                       let JSONObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? JSONObject,
                       let error = Error(JSONObject: JSONObject) {
                        return errorHandler(response, .URLSessionError(msg: "Failed with status code '\(response.statusCode)'; Error: '\(error)'"))
                    } else {
                        return errorHandler(response, .URLSessionError(msg: "Failed with status code '\(response.statusCode)'"))
                    }
                }
            } else {
                return errorHandler(nil, .URLSessionError(msg: "Failed to receive response"))
            }
        }) 
    }

    public func JSONTaskWithURL(_ url: URL, successHandler: @escaping (URLResponse?, JSONObject) -> Void, errorHandler: @escaping (URLResponse?, MarvelKitError) -> Void) -> URLSessionTask {
        return dataTaskWithURL(url, successHandler: { response, data in
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? JSONObject {
                    return successHandler(response, jsonObject)
                } else {
                    return errorHandler(response, .JSONSerializationError(msg: "Failed to deserialize JSON"))
                }
            } catch {
                return errorHandler(response, .JSONSerializationError(msg: "\(error)"))
            }
        }, errorHandler: errorHandler)
    }

    public func resourceTaskWithURL<Resource: ResourceProtocol & DataProtocol>(_ url: URL, successHandler: @escaping (URLResponse?, DataWrapper<DataContainer<Resource>>) -> Void, errorHandler: @escaping (URLResponse?, MarvelKitError) -> Void) -> URLSessionTask {
        return JSONTaskWithURL(url, successHandler: { response, JSONObject in
            if let resource = DataWrapper<DataContainer<Resource>>(JSONObject: JSONObject) {
                return successHandler(response, resource)
            } else {
                return errorHandler(response, .JSONObjectConvertibleError(msg: "Failed to initialize resource with JSON object"))
            }
        }, errorHandler: errorHandler)
    }
    
}
