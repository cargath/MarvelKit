//
//  CharacterList.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 28.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct CharacterList {

    /**
     * The number of total available characters in this list.
     * Will always be greater than or equal to the "returned" value.
     */
    public let available: Int?

    /**
     * The number of characters returned in this collection (up to 20).
     */
    public let returned: Int?

    /**
     * The path to the full list of characters in this collection.
     */
    public let collectionURI: String?

    /**
     * The list of returned characters in this collection.
     */
    public let items: [CharacterSummary]

}
