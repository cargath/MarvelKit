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

    public init?(jsonObject: JSONObject) {
        self.resourceURI = jsonObject["resourceURI"] as? String
        self.name = jsonObject["name"] as? String
        self.type = jsonObject["type"] as? String
    }

}

// MARK: - Typealias used in the Marvel API docs

public typealias StoryList = List<StorySummary>
