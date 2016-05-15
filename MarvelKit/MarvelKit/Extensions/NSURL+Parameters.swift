//
//  NSURL+Parameters.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public typealias URLParameters = [String: String]

public extension NSURLComponents {

    public func byAppendingQueryItems(queryItems: [NSURLQueryItem]) -> NSURLComponents {
        if !queryItems.isEmpty {
            self.queryItems = (self.queryItems ?? []) + queryItems
        }
        return self
    }

    public func byAppendParameters(parameters: URLParameters) -> NSURLComponents {
        return byAppendingQueryItems(parameters.flatMap { key, value in NSURLQueryItem(name: key, value: value) })
    }

}

public extension NSURL {

    public func byAppendingParameters(parameters: URLParameters) -> NSURL? {
        return NSURLComponents(string: absoluteString)?.byAppendParameters(parameters).URL
    }
    
}
