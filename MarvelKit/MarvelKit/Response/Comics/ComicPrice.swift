//
//  ComicPrice.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct ComicPrice: Codable {

    /// A description of the price (e.g. print price, digital price).
    public let type: String?

    /// The price (all prices in USD).
    public let price: Float?

}
