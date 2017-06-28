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

    /// Return only characters matching the specified full character name (e.g. Spider-Man).
    case name(String)

    /// Return characters with names that begin with the specified string (e.g. Sp).
    case nameStartsWith(String)

    /// Return only characters which have been modified since the specified date.
    case modifiedSince(Date)

    /// Return only characters which appear in the specified comics.
    case comics([Int])

    /// Return only characters which appear the specified series.
    case series([Int])

    /// Return only characters which appear in the specified events.
    case events([Int])

    /// Return only characters which appear the specified stories.
    case stories([Int])

    /// Order the result set by a field or fields.
    /// Multiple values are given priority in the order in which they are passed.
    case orderBy([Order])

    /// Limit the result set to the specified number of resources.
    case limit(Int)

    /// Skip the specified number of resources in the result set.
    case offset(Int)

}

extension CharacterParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .name:
                return "name"
            case .nameStartsWith:
                return "nameStartsWith"
            case .modifiedSince:
                return "modifiedSince"
            case .comics:
                return "comics"
            case .series:
                return "series"
            case .events:
                return "events"
            case .stories:
                return "stories"
            case .orderBy:
                return "orderBy"
            case .limit:
                return "limit"
            case .offset:
                return "offset"
        }
    }

    public var value: String {
        switch self {
            case let .name(value):
                return value
            case let .nameStartsWith(value):
                return value
            case let .modifiedSince(value):
                return value.string
            case let .comics(value):
                return value.csv
            case let .series(value):
                return value.csv
            case let .events(value):
                return value.csv
            case let .stories(value):
                return value.csv
            case let .orderBy(value):
                return value.map({ $0.rawValue }).csv
            case let .limit(value):
                return "\(value)"
            case let .offset(value):
                return "\(value)"
        }
    }

}
