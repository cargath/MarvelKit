//
//  EventParameter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum EventParameter {

    public enum Order: String {

        // name
        case NameAscending = "name"
        case NameDescending = "-name"

        // start date
        case StartDateAscending = "startDate"
        case StartDateDescending = "-startDate"

        // modified since
        case ModifiedAscending = "modified"
        case ModifiedDescending = "-modified"
        
    }

    /**
     * Return only events which match the specified name.
     */
    case Name(String)

    /**
     * Return events with names that begin with the specified string (e.g. Sp).
     */
    case NameStartsWith(String)

    /**
     * Return only events which have been modified since the specified date.
     */
    case ModifiedSince(NSDate)

    /**
     * Return only events which feature work by the specified creators.
     */
    case Creators([Int])

    /**
     * Return only events which feature the specified characters.
     */
    case Characters([Int])

    /**
     * Return only events which are part of the specified series.
     */
    case Series([Int])

    /**
     * Return only events which take place in the specified comics.
     */
    case Comics([Int])

    /**
     * Return only events which take place in the specified stories.
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

extension EventParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .Name:
                return "name"
            case .NameStartsWith:
                return "nameStartsWith"
            case .ModifiedSince:
                return "modifiedSince"
            case .Creators:
                return "creators"
            case .Characters:
                return "characters"
            case .Series:
                return "series"
            case .Comics:
                return "comics"
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
            case let .Creators(value):
                return value.csv
            case let .Characters(value):
                return value.csv
            case let .Series(value):
                return value.csv
            case let .Comics(value):
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
