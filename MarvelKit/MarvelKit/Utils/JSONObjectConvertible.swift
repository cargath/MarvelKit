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

// MARK: - Get JSON objects from resource

public extension JSONSerialization {

    public class func JSONObject(named name: String, forBundle bundle: Bundle) -> JSONObject? {

        if let
            filePath = bundle.path(forResource: name, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSONObject {

            return json
        }

        return nil
    }
    
}

// MARK: - JSONObjectConvertible interface

public protocol JSONObjectConvertible {
    init?(JSONObject: JSONObject)
}

// MARK: - JSONObjectConvertible + convenience initializer for optionals

public extension JSONObjectConvertible {

    public init?(JSONObject: JSONObject?) {
        if let JSONObject = JSONObject {
            self.init(JSONObject: JSONObject)
        } else {
            return nil
        }
    }

}

// MARK: - JSONObjectConvertible + factory methods for JSONArrays

public extension JSONObjectConvertible {

    public static func from(JSONArray: JSONArray) -> [Self] {
        return JSONArray.flatMap { JSONObject in
            return Self.init(JSONObject: JSONObject)
        }
    }

    public static func from(JSONArray: JSONArray?) -> [Self] {
        if let JSONArray = JSONArray {
            return from(JSONArray: JSONArray)
        } else {
            return []
        }
    }
    
}
