//
//  Authentication.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import CommonCryptoWrapper

/// Authentication for Server-Side Applications
/// ===========================================
///
/// Server-side applications must pass three parameters:
///
/// - ts: A timestamp (or other long string which can change on a request-by-request basis).
/// - apikey: Your public key.
/// - hash: A md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)).
///
/// For example, a user with a public key of "1234" and a private key of "abcd" could construct a valid call as follows:
///
///     http://gateway.marvel.com/v1/comics?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150
///
/// (the hash value is the md5 digest of 1abcd1234)
public protocol Authentication {

    var privateKey: String { get }

    var publicKey: String { get }
    
}

public extension Authentication {

    /// A timestamp (or other long string which can change on a request-by-request basis)
    var timestamp: String {
        return String(Int(Date().timeIntervalSince1970))
    }

    /// A md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)).
    func hash(timestamp: String) -> String {
        return timestamp.appending(privateKey).appending(publicKey).md5
    }

    /// A md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)).
    func hash() -> String {
        return hash(timestamp: timestamp)
    }
    
}

public extension Authentication {

    func queryItems(timestamp: String, publicKey: String, hash: String) -> [URLQueryItem] {
        return [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
    }

    func queryItems() -> [URLQueryItem] {
        return queryItems(timestamp: timestamp, publicKey: publicKey, hash: hash())
    }

}
