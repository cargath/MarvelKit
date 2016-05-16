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
        case NameAscending = "name"
        case NameDescending = "-name"

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
        switch self {
            case .Name:
                return "name"
            case .NameStartsWith:
                return "nameStartsWith"
            case .ModifiedSince:
                return "modifiedSince"
            case .Comics:
                return "comics"
            case .Series:
                return "series"
            case .Events:
                return "events"
            case .Stories:
                return "stories"
            case .OrderBy:
                return "orderBy"
            case .Limit:
                return "limit"
            case .Offset:
                return "offset"
        }
    }

    public var value: String {
        switch self {
            case let .Name(value):
                return value
            case let .NameStartsWith(value):
                return value
            case let .ModifiedSince(value):
                return value.string
            case let .Comics(value):
                return value.csv
            case let .Series(value):
                return value.csv
            case let .Events(value):
                return value.csv
            case let .Stories(value):
                return value.csv
            case let .OrderBy(value):
                return value.flatMap({ $0.rawValue }).csv
            case let .Limit(value):
                return "\(value)"
            case let .Offset(value):
                return "\(value)"
        }
    }

}
