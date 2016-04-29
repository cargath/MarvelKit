//
//  ComicList.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct ComicList {

    /**
     * The number of total available issues in this list.
     * Will always be greater than or equal to the "returned" value.
     */
    public let available: Int?

    /**
     * The number of issues returned in this collection (up to 20).
     */
    public let returned: Int?

    /**
     * The path to the full list of issues in this collection.
     */
    public let collectionURI: String?

    /**
     * The list of returned issues in this collection.
     */
    public let items: [ComicSummary]

}
