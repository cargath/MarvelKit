//
//  CreatorList.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct CreatorList {

    /**
     * The number of total available creators in this list.
     * Will always be greater than or equal to the "returned" value.
     */
    public let available: Int?

    /**
     * The number of creators returned in this collection (up to 20).
     */
    public let returned: Int?

    /**
     * The path to the full list of creators in this collection.
     */
    public let collectionURI: String?

    /**
     * The list of returned creators in this collection.
     */
    public let items: [CreatorSummary]

}
