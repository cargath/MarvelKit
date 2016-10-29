//
//  ComicDate.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - ComicDate

public struct ComicDate {

    /**
     * A description of the date (e.g. onsale date, FOC date).
     */
    public let type: String?

    /**
     * The date.
     */
    public let date: String?

}

// MARK: - ComicDate + JSONObjectConvertible

extension ComicDate: JSONObjectConvertible {

    public init?(JSONObject: JSONObject) {
        self.type = JSONObject["type"] as? String
        self.date = JSONObject["date"] as? String
    }

}
