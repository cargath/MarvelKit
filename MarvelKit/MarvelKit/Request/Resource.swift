//
//  Resource.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public protocol ResourceProtocol: Codable {

    associatedtype ResourceFilterType: ResourceFilterProtocol

    associatedtype ResourceParameterType: ResourceParameterProtocol

    static var name: String { get }

}

public extension ResourceProtocol {

    static var baseURLString: String {
        return "https://gateway.marvel.com/v1/public"
    }

    static var baseURL: URL? {
        return URL(string: baseURLString)
    }

}

public extension ResourceProtocol {

    static func pathComponent() -> String {
        return name
    }

    static func pathComponent(id: Int) -> String {
        return "\(name)/\(id)"
    }

    static func pathComponent(filter: ResourceFilter<ResourceFilterType>) -> String {
        return "\(filter.pathComponent)/\(name)"
    }

}

public extension ResourceProtocol {

    static func absoluteURL() -> URL? {
        return baseURL?.appendingPathComponent(pathComponent())
    }

    static func absoluteURL(id: Int) -> URL? {
        return baseURL?.appendingPathComponent(pathComponent(id: id))
    }

    static func absoluteURL(filter: ResourceFilter<ResourceFilterType>) -> URL? {
        return baseURL?.appendingPathComponent(pathComponent(filter: filter))
    }
    
}
