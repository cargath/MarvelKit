//
//  JSONObjectConvertible.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - JSON objects defined by Swift Standard Library data types

public typealias JSONObject = Dictionary<String, AnyObject>
public typealias JSONArray = Array<JSONObject>

// MARK: - JSONObjectConvertible interface

public protocol JSONObjectConvertible {
    init?(jsonObject: JSONObject)
}

// MARK: - JSONObjectConvertible + convenience initializer for optionals

public extension JSONObjectConvertible {

    public init?(jsonObject: JSONObject?) {
        if let jsonObject = jsonObject {
            self.init(jsonObject: jsonObject)
        } else {
            return nil
        }
    }

}

// MARK: - JSONObjectConvertible + factory methods for JSONArrays

public extension JSONObjectConvertible {

    public static func fromJSONArray(jsonArray: JSONArray) -> [Self] {
        return jsonArray.flatMap { jsonObject in
            return Self.init(jsonObject: jsonObject)
        }
    }

    public static func fromJSONArray(jsonArray: JSONArray?) -> [Self] {
        if let jsonArray = jsonArray {
            return fromJSONArray(jsonArray)
        } else {
            return []
        }
    }
    
}
