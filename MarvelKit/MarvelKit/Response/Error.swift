//
//  Error.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Error

public struct Error {

    public let message: String

    public let code: String

}

// MARK: - Error + JSONObjectConvertible

extension Error: JSONObjectConvertible {

    public init?(jsonObject: JSONObject) {

        guard let
            message = jsonObject["message"] as? String,
            let code = jsonObject["code"] as? String else {

            return nil
        }

        self.message = message
        self.code = code
    }

}

// MARK: - Error + CustomStringConvertible

extension Error: CustomStringConvertible {

    public var description: String {
        return "\(message) (\(code))"
    }

}
