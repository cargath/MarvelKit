//
//  Url.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 28.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Url

public struct Url {

    /**
     * A text identifier for the URL.
     */
    public let type: String?

    /**
     * A full URL (including scheme, domain, and path).
     */
    public let url: String?

}

// MARK: Url + JSONObjectConvertible

extension Url: JSONObjectConvertible {

    public init(JSONObject: Dictionary<String, AnyObject>) {
        self.type = JSONObject["type"] as? String
        self.url = JSONObject["url"] as? String
    }

}
