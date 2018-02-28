//
//  URL+Parameters.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public typealias URLParameters = [String: String]

public extension URLComponents {

    public func appendingQueryItems(_ queryItems: [URLQueryItem]) -> URLComponents {

        var copy = self

        if !queryItems.isEmpty {
            copy.queryItems = (copy.queryItems ?? []) + queryItems
        }

        return copy
    }

    public func appendingParameters(_ parameters: URLParameters) -> URLComponents {
        return appendingQueryItems(parameters.flatMap { key, value in
            URLQueryItem(name: key, value: value)
        })
    }

}

public extension URL {

    public func appendingParameters(_ parameters: URLParameters) -> URL? {
        return URLComponents(string: absoluteString)?.appendingParameters(parameters).url
    }
    
}
