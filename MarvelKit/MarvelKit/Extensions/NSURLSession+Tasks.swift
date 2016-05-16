//
//  NSURLSession+Tasks.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public enum MarvelKitError: ErrorType {

    case JSONObjectConvertibleError(msg: String)
    case NSJSONSerializationError(msg: String)
    case NSURLSessionError(msg: String)
    case NSURLError(msg: String)

}

public extension MarvelKitError {

    var description: String {
        switch self {
            case let .JSONObjectConvertibleError(msg):
                return msg
            case let .NSJSONSerializationError(msg):
                return msg
            case let .NSURLSessionError(msg):
                return msg
            case let .NSURLError(msg):
                return msg
        }
    }

}

public extension NSURLSession {

    public typealias ErrorHandler = (NSURLResponse?, MarvelKitError) -> Void

    public func dataTaskWithURL(url: NSURL, successHandler: (NSURLResponse?, NSData) -> Void, errorHandler: ErrorHandler) -> NSURLSessionDataTask {
        return dataTaskWithURL(url) { data, response, error in
            if let error = error {
                return errorHandler(response, .NSURLSessionError(msg: error.localizedDescription))
            } else if let response = response as? NSHTTPURLResponse {
                if response.statusCode == 200 {
                    if let data = data {
                        return successHandler(response, data)
                    } else {
                        return errorHandler(response, .NSURLSessionError(msg: "Failed to receive data"))
                    }
                } else {
                    if let
                        data = data,
                        jsonObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? JSONObject,
                        error = Error(jsonObject: jsonObject) {
                        return errorHandler(response, .NSURLSessionError(msg: "Failed with status code '\(response.statusCode)'; Error: '\(error)'"))
                    } else {
                        return errorHandler(response, .NSURLSessionError(msg: "Failed with status code '\(response.statusCode)'"))
                    }
                }
            } else {
                return errorHandler(nil, .NSURLSessionError(msg: "Failed to receive response"))
            }
        }
    }

    public func JSONTaskWithURL(url: NSURL, successHandler: (NSURLResponse?, JSONObject) -> Void, errorHandler: ErrorHandler) -> NSURLSessionTask {
        return dataTaskWithURL(url, successHandler: { response, data in
            do {
                if let jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? JSONObject {
                    return successHandler(response, jsonObject)
                } else {
                    return errorHandler(response, .NSJSONSerializationError(msg: "Failed to deserialize JSON"))
                }
            } catch {
                return errorHandler(response, .NSJSONSerializationError(msg: "\(error)"))
            }
        }, errorHandler: errorHandler)
    }

    public func resourceTaskWithURL<Resource: protocol<ResourceProtocol, DataProtocol>>(url: NSURL, successHandler: (NSURLResponse?, DataWrapper<DataContainer<Resource>>) -> Void, errorHandler: ErrorHandler) -> NSURLSessionTask {
        return JSONTaskWithURL(url, successHandler: { response, jsonObject in
            if let resource = DataWrapper<DataContainer<Resource>>(jsonObject: jsonObject) {
                return successHandler(response, resource)
            } else {
                return errorHandler(response, .JSONObjectConvertibleError(msg: "Failed to initialize resource with JSON object"))
            }
        }, errorHandler: errorHandler)
    }
    
}
