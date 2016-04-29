//
//  SeriesList.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct SeriesList {

    /**
     * The number of total available series in this list.
     * Will always be greater than or equal to the "returned" value.
     */
    public let available: Int?

    /**
     * The number of series returned in this collection (up to 20).
     */
    public let returned: Int?

    /**
     * The path to the full list of series in this collection.
     */
    public let collectionURI: String?

    /**
     * The list of returned series in this collection.
     */
    public let items: [SeriesSummary]

}
