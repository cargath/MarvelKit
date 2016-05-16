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

    /**
     * Return only stories which have been modified since the specified date.
     */
    case ModifiedSince(NSDate)

    /**
     * Return only stories contained in the specified comics.
     */
    case Comics([Int])

    /**
     * Return only stories contained the specified series.
     */
    case Series([Int])

    /**
     * Return only stories which take place during the specified events.
     */
    case Events([Int])

    /**
     * Return only stories which feature work by the specified creators.
     */
    case Creators([Int])

    /**
     * Return only stories which feature the specified characters.
     */
    case Characters([Int])

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

extension StoryParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .ModifiedSince:
                return "modifiedSince"
            case .Comics:
                return "comics"
            case .Series:
                return "series"
            case .Events:
                return "events"
            case .Creators:
                return "creators"
            case .Characters:
                return "characters"
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
            case let .ModifiedSince(value):
                return value.string
            case let .Comics(value):
                return value.csv
            case let .Series(value):
                return value.csv
            case let .Events(value):
                return value.csv
            case let .Creators(value):
                return value.csv
            case let .Characters(value):
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
