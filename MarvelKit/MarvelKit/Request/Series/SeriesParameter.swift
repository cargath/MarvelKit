//
//  SeriesParameter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum SeriesParameter {

    public enum Type: String {

        case Collection = "collection"
        case OneShot = "one shot"
        case Limited = "limited"
        case Ongoing = "ongoing"

    }

    public enum Order: String {

        // title
        case TitleAscending = "title"
        case TitleDescending = "-title"

        // modified since
        case ModifiedAscending = "modified"
        case ModifiedDescending = "-modified"

        // start year
        case StartYearAscending = "startYear"
        case StartYearDescending = "-startYear"
        
    }

    /**
     * Return only series matching the specified title.
     */
    case Title(String)

    /**
     * Return series with titles that begin with the specified string (e.g. Sp).
     */
    case TitleStartsWith(String)

    /**
     * Return only series matching the specified start year.
     */
    case StartYear(Int)

    /**
     * Return only series which have been modified since the specified date.
     */
    case ModifiedSince(NSDate)

    /**
     * Return only series which contain the specified comics.
     */
    case Comics([Int])

    /**
     * Return only series which contain the specified stories.
     */
    case Stories([Int])

    /**
     * Return only series which have comics that take place during the specified events.
     */
    case Events([Int])

    /**
     * Return only series which feature work by the specified creators.
     */
    case Creators([Int])

    /**
     * Return only series which feature the specified characters.
     */
    case Characters([Int])

    /**
     * Filter the series by publication frequency type.
     */
    case SeriesType(Type)

    /**
     * Return only series containing one or more comics with the specified format.
     */
    case Contains([ComicParameter.IssueFormat])

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

extension SeriesParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .Title:
                return "title"
            case .TitleStartsWith:
                return "titleStartsWith"
            case .StartYear:
                return "startYear"
            case .ModifiedSince:
                return "modifiedSince"
            case .Comics:
                return "comics"
            case .Stories:
                return "stories"
            case .Events:
                return "events"
            case .Creators:
                return "creators"
            case .Characters:
                return "characters"
            case .SeriesType:
                return "seriesType"
            case .Contains:
                return "contains"
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
            case let .Title(value):
                return value
            case let .TitleStartsWith(value):
                return value
            case let .StartYear(value):
                return "\(value)"
            case let .ModifiedSince(value):
                return value.string
            case let .Comics(value):
                return value.csv
            case let .Stories(value):
                return value.csv
            case let .Events(value):
                return value.csv
            case let .Creators(value):
                return value.csv
            case let .Characters(value):
                return value.csv
            case let .SeriesType(value):
                return value.rawValue
            case let .Contains(value):
                return value.flatMap({ $0.rawValue }).csv
            case let .OrderBy(value):
                return value.flatMap({ $0.rawValue }).csv
            case let .Limit(value):
                return "\(value)"
            case let .Offset(value):
                return "\(value)"
        }
    }

}
