//
//  CharacterParameter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum CharacterParameter {

    public enum Order: String {

        // name
        case NameAscending = "nameDate"
        case NameDescending = "-nameDate"

        // modified since
        case ModifiedAscending = "modified"
        case ModifiedDescending = "-modified"
        
    }

    /**
     * Return only characters matching the specified full character name (e.g. Spider-Man).
     */
    case Name(String)

    /**
     * Return characters with names that begin with the specified string (e.g. Sp).
     */
    case NameStartsWith(String)

    /**
     * Return only characters which have been modified since the specified date.
     */
    case ModifiedSince(NSDate)

    /**
     * Return only characters which appear in the specified comics.
     */
    case Comics([Int])

    /**
     * Return only characters which appear the specified series.
     */
    case Series([Int])

    /**
     * Return only characters which appear in the specified events.
     */
    case Events([Int])

    /**
     * Return only characters which appear the specified stories.
     */
    case Stories([Int])

    /**
     * Order the result set by a field or fields.
     * Multiple values are given priority in the order in which they are passed.
     */
    case OrderBy([Order])

    /**
     * Limit the result set to the specified number of resources.
     */
    case Limit(Int)

    /**
     * Skip the specified number of resources in the result set.
     */
    case Offset(Int)

}

extension CharacterParameter: ResourceParameterProtocol {

    public var key: String {
        return "key"
    }

    public var value: String {
        return "value"
    }

}
