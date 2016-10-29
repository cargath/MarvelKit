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

    public init?(JSONObject: JSONObject) {

        guard let
            message = JSONObject["message"] as? String,
            let code = JSONObject["code"] as? String else {

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
