//
//  ComicPrice.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - ComicPrice

public struct ComicPrice {

    /**
     * A description of the price (e.g. print price, digital price).
     */
    public let type: String?

    /**
     * The price (all prices in USD).
     */
    public let price: Float?

}

// MARK: - ComicPrice + JSONObjectConvertible

extension ComicPrice: JSONObjectConvertible {

    public init?(JSONObject: JSONObject) {
        self.type = JSONObject["type"] as? String
        self.price = JSONObject["price"] as? Float
    }

}
