//
//  NSURLSession+Tasks.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public enum MarvelKitError: Swift.Error {

    case jsonObjectConvertibleError(msg: String)
    case nsjsonSerializationError(msg: String)
    case nsurlSessionError(msg: String)
    case nsurlError(msg: String)

}

public extension MarvelKitError {

    var description: String {
        switch self {
            case let .jsonObjectConvertibleError(msg):
                return msg
            case let .nsjsonSerializationError(msg):
                return msg
            case let .nsurlSessionError(msg):
                return msg
            case let .nsurlError(msg):
                return msg
        }
    }

}

public extension URLSession {

    public typealias ErrorHandler = (URLResponse?, MarvelKitError) -> Void

    public func dataTaskWithURL(_ url: URL, successHandler: @escaping (URLResponse?, Data) -> Void, errorHandler: @escaping ErrorHandler) -> URLSessionDataTask {
        return dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                return errorHandler(response, .nsurlSessionError(msg: error.localizedDescription))
            } else if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    if let data = data {
                        return successHandler(response, data)
                    } else {
                        return errorHandler(response, .nsurlSessionError(msg: "Failed to receive data"))
                    }
                } else {
                    if let
                        data = data,
                        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? JSONObject,
                        let error = Error(jsonObject: jsonObject) {
                        return errorHandler(response, .nsurlSessionError(msg: "Failed with status code '\(response.statusCode)'; Error: '\(error)'"))
                    } else {
                        return errorHandler(response, .nsurlSessionError(msg: "Failed with status code '\(response.statusCode)'"))
                    }
                }
            } else {
                return errorHandler(nil, .nsurlSessionError(msg: "Failed to receive response"))
            }
        }) 
    }

    public func JSONTaskWithURL(_ url: URL, successHandler: @escaping (URLResponse?, JSONObject) -> Void, errorHandler: @escaping ErrorHandler) -> URLSessionTask {
        return dataTaskWithURL(url, successHandler: { response, data in
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? JSONObject {
                    return successHandler(response, jsonObject)
                } else {
                    return errorHandler(response, .nsjsonSerializationError(msg: "Failed to deserialize JSON"))
                }
            } catch {
                return errorHandler(response, .nsjsonSerializationError(msg: "\(error)"))
            }
        }, errorHandler: errorHandler)
    }

    public func resourceTaskWithURL<Resource: ResourceProtocol & DataProtocol>(_ url: URL, successHandler: @escaping (URLResponse?, DataWrapper<DataContainer<Resource>>) -> Void, errorHandler: @escaping ErrorHandler) -> URLSessionTask {
        return JSONTaskWithURL(url, successHandler: { response, jsonObject in
            if let resource = DataWrapper<DataContainer<Resource>>(jsonObject: jsonObject) {
                return successHandler(response, resource)
            } else {
                return errorHandler(response, .jsonObjectConvertibleError(msg: "Failed to initialize resource with JSON object"))
            }
        }, errorHandler: errorHandler)
    }
    
}
