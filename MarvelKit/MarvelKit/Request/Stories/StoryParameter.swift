//
//  StoryParameter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum StoryParameter {

    public enum Order: String {

        // id
        case IDAscending = "id"
        case IDDescending = "-id"

        // modified since
        case ModifiedAscending = "modified"
        case ModifiedDescending = "-modified"
        
    }

    /// Return only stories which have been modified since the specified date.
    case modifiedSince(Date)

    /// Return only stories contained in the specified comics.
    case comics([Int])

    /// Return only stories contained the specified series.
    case series([Int])

    /// Return only stories which take place during the specified events.
    case events([Int])

    /// Return only stories which feature work by the specified creators.
    case creators([Int])

    /// Return only stories which feature the specified characters.
    case characters([Int])

    /// Order the result set by a field or fields.
    /// Multiple values are given priority in the order in which they are passed.
    case orderBy([Order])

    /// Limit the result set to the specified number of resources.
    case limit(Int)

    /// Skip the specified number of resources in the result set.
    case offset(Int)

}

extension StoryParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .modifiedSince:
                return "modifiedSince"
            case .comics:
                return "comics"
            case .series:
                return "series"
            case .events:
                return "events"
            case .creators:
                return "creators"
            case .characters:
                return "characters"
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
            case let .modifiedSince(value):
                return value.string
            case let .comics(value):
                return value.csv
            case let .series(value):
                return value.csv
            case let .events(value):
                return value.csv
            case let .creators(value):
                return value.csv
            case let .characters(value):
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
