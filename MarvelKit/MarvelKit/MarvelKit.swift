//
//  MarvelKit.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public class MarvelKit {

    static func hashParam(privateKey privateKey: String, publicKey: String, timeStamp: String) -> String {
        return timeStamp.stringByAppendingString(privateKey).stringByAppendingString(publicKey).md5
    }

    static func authParams(privateKey privateKey: String, publicKey: String, timeStamp: String) -> URLParameters {
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

    public func fetch<Resource: ResourceProtocol>(resource: Resource.Type, successHandler: DataWrapper<DataContainer<Resource>> -> Void, errorHandler: MarvelKitError -> Void) {
        if let url = resource.absoluteURL()?.byAppendingParameters(MarvelKit.authParams(privateKey: privateKey, publicKey: publicKey, timeStamp: ts)) {
            defaultSession.resourceTaskWithURL(url, successHandler: { response, resource in
                successHandler(resource)
            }, errorHandler: { response, error in
                errorHandler(error)
            }).resume()
        } else {
            errorHandler(.NSURLError(msg: "Failed to create URL for resource"))
        }
    }

}
