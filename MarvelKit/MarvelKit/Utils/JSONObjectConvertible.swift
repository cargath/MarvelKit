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

    public class func JSONObjectNamed(_ name: String, forBundle bundle: Bundle) -> JSONObject? {

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

    public static func fromJSONArray(_ jsonArray: JSONArray) -> [Self] {
        return jsonArray.flatMap { jsonObject in
            return Self.init(jsonObject: jsonObject)
        }
    }

    public static func fromJSONArray(_ jsonArray: JSONArray?) -> [Self] {
        if let jsonArray = jsonArray {
            return fromJSONArray(jsonArray)
        } else {
            return []
        }
    }
    
}
