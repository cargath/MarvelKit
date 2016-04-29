//
//  CharacterSummary.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 28.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Summary implementation

public struct CharacterSummary: SummaryProtocol {

    /**
     * The path to the individual character resource.
     */
    public let resourceURI: String?

    /**
     * The full name of the character.
     */
    public let name: String?

    /**
     * The role of the creator in the parent entity.
     */
    public let role: String?

}

// MARK: - Summary + JSONObjectConvertible

extension CharacterSummary {

    public init?(jsonObject: JSONObject) {
        self.resourceURI = jsonObject["resourceURI"] as? String
        self.name = jsonObject["name"] as? String
        self.role = jsonObject["role"] as? String
    }
    
}

// MARK: - Typealias used in the Marvel API docs

public typealias CharacterList = List<CharacterSummary>
