//
//  StoryDataContainer.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct StoryDataContainer {

    /**
     * The requested offset (number of skipped results) of the call.
     */
    public let offset: Int?

    /**
     * The requested result limit.
     */
    public let limit: Int?

    /**
     * The total number of resources available given the current filter set.
     */
    public let total: Int?

    /**
     * The total number of results returned by this call.
     */
    public let count: Int?

    /**
     * The list of stories returned by the call.
     */
    public let results: [Story]

}
