//
//  StorySummary.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 28.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Summary implementation

public struct StorySummary: SummaryProtocol {

    /**
     * The path to the individual story resource.
     */
    public let resourceURI: String?

    /**
     * The canonical name of the story.
     */
    public let name: String?

    /**
     * The type of the story (interior or cover).
     */
    public let type: String?

}

// MARK: - Summary + JSONObjectConvertible

extension StorySummary {

    public init?(JSONObject: JSONObject) {
        self.resourceURI = JSONObject["resourceURI"] as? String
        self.name = JSONObject["name"] as? String
        self.type = JSONObject["type"] as? String
    }

}

// MARK: - Typealias used in the Marvel API docs

public typealias StoryList = List<StorySummary>
