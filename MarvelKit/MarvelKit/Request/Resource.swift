//
//  Resource.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public protocol ResourceProtocol {

    associatedtype ResourceFilterType: ResourceFilterProtocol

    associatedtype ResourceParameterType: ResourceParameterProtocol

    static var name: String { get }

    init?(jsonObject: JSONObject)

}

public extension ResourceProtocol {

    public static var baseURLString: String {
        return "https://gateway.marvel.com/v1/public"
    }

    public static var baseURL: URL? {
        return URL(string: baseURLString)
    }

}

public extension ResourceProtocol {

    public static func pathComponent() -> String {
        return name
    }

    public static func pathComponent(id: Int) -> String {
        return "\(name)/\(id)"
    }

    public static func pathComponent(filter: ResourceFilter<ResourceFilterType>) -> String {
        return "\(filter.pathComponent)/\(name)"
    }

}

public extension ResourceProtocol {

    public static func absoluteURL() -> URL? {
        return baseURL?.appendingPathComponent(pathComponent())
    }

    public static func absoluteURL(id: Int) -> URL? {
        return baseURL?.appendingPathComponent(pathComponent(id: id))
    }

    public static func absoluteURL(filter: ResourceFilter<ResourceFilterType>) -> URL? {
        return baseURL?.appendingPathComponent(pathComponent(filter: filter))
    }
    
}
