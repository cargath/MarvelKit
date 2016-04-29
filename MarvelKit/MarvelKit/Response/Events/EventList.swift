//
//  EventList.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 28.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct EventList {

    /**
     * The number of total available events in this list.
     * Will always be greater than or equal to the "returned" value.
     */
    public let available: Int?

    /**
     * The number of events returned in this collection (up to 20).
     */
    public let returned: Int?

    /**
     * The path to the full list of events in this collection.
     */
    public let collectionURI: String?

    /**
     * The list of returned events in this collection.
     */
    public let items: [EventSummary]

}
