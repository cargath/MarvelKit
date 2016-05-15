//
//  Resource.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public protocol ResourceProtocol {

    associatedtype ResourceFilterType: ResourceFilterProtocol

    static var name: String { get }

    init?(jsonObject: JSONObject)

}

public extension ResourceProtocol {

    public static var baseURLString: String {
        return "https://gateway.marvel.com/v1/public"
    }

    public static var baseURL: NSURL? {
        return NSURL(string: baseURLString)
    }

}

public extension ResourceProtocol {

    public static func pathComponent() -> String {
        return name
    }

    public static func pathComponent(id id: Int) -> String {
        return "\(name)/\(id)"
    }

    public static func pathComponent(filter filter: ResourceFilter<ResourceFilterType>) -> String {
        return "\(filter.pathComponent)/\(name)"
    }

}

public extension ResourceProtocol {

    public static func absoluteURL() -> NSURL? {
        return baseURL?.URLByAppendingPathComponent(pathComponent())
    }

    public static func absoluteURL(id id: Int) -> NSURL? {
        return baseURL?.URLByAppendingPathComponent(pathComponent(id: id))
    }

    public static func absoluteURL(filter filter: ResourceFilter<ResourceFilterType>) -> NSURL? {
        return baseURL?.URLByAppendingPathComponent(pathComponent(filter: filter))
    }
    
}
