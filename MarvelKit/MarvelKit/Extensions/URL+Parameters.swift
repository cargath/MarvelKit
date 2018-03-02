//
//  URL+Parameters.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public extension URLComponents {

    public func appendingQueryItems(_ queryItems: [URLQueryItem]) -> URLComponents {
        var copy = self
        copy.queryItems = (copy.queryItems ?? []) + queryItems
        return copy
    }

}

public extension URL {

    public func appendingQueryItems(_ queryItems: [URLQueryItem]) -> URL? {
        return URLComponents(string: absoluteString)?.appendingQueryItems(queryItems).url
    }
    
}
