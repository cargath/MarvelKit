//
//  Error.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Error

public struct Error: Swift.Error, Codable {

    public let message: String

    public let code: String

}

// MARK: - Error + CustomStringConvertible

extension Error: CustomStringConvertible {

    public var description: String {
        return "\(message) (\(code))"
    }

}
