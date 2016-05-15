//
//  MarvelKit.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
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
            } else if let data = data {
                return successHandler(response, data)
            } else {
                return errorHandler(response, .NSURLSessionError(msg: "Failed to receive data"))
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

    public func resourceTaskWithURL<Resource: ResourceProtocol>(url: NSURL, successHandler: (NSURLResponse?, Resource) -> Void, errorHandler: ErrorHandler) -> NSURLSessionTask {
        return JSONTaskWithURL(url, successHandler: { response, jsonObject in
            if let resource = Resource(jsonObject: jsonObject) {
                return successHandler(response, resource)
            } else {
                return errorHandler(response, .JSONObjectConvertibleError(msg: "Failed to initialize resource with JSON object"))
            }
        }, errorHandler: errorHandler)
    }
    
}

public class MarvelKit {

    static func hashParam(privateKey privateKey: String, publicKey: String, timeStamp: String) -> String {
        return timeStamp.stringByAppendingString(publicKey).stringByAppendingString(privateKey).md5
    }

    static func authParams(privateKey privateKey: String, publicKey: String, timeStamp: String) -> [String: String] {
        return [
            "ts": timeStamp,
            "apikey": publicKey,
            "hash": hashParam(privateKey: privateKey, publicKey: publicKey, timeStamp: timeStamp)
        ]
    }

    let defaultSession = NSURLSession(configuration: .defaultSessionConfiguration())

    let privateKey: String

    let publicKey: String

    /**
     * A timestamp (or other long string which can change on a request-by-request basis)
     */
    var ts: String {
        return String(NSDate().timeIntervalSince1970)
    }

    /**
     * A md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey).
     */
    var hash: String {
        return MarvelKit.hashParam(privateKey: privateKey, publicKey: publicKey, timeStamp: ts)
    }

    public init(privateKey: String, publicKey: String) {
        self.privateKey = privateKey
        self.publicKey = publicKey
    }

    public func fetch<Resource: ResourceProtocol>(resource: Resource.Type, successHandler: Resource -> Void, errorHandler: MarvelKitError -> Void) {
        if let url = resource.absoluteURL() {
            defaultSession.resourceTaskWithURL(url, successHandler: { response, resource in
                successHandler(resource)
            }, errorHandler: { response, error in
                errorHandler(error)
            })
        } else {
            errorHandler(.NSURLError(msg: "Failed to create URL for resource"))
        }
    }

}
