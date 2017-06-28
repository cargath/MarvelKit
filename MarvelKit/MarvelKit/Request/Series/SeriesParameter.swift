//
//  SeriesParameter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum SeriesParameter {

    public enum `Type`: String {

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

    /// Return only series matching the specified title.
    case title(String)

    /// Return series with titles that begin with the specified string (e.g. Sp).
    case titleStartsWith(String)

    /// Return only series matching the specified start year.
    case startYear(Int)

    /// Return only series which have been modified since the specified date.
    case modifiedSince(Date)

    /// Return only series which contain the specified comics.
    case comics([Int])

    /// Return only series which contain the specified stories.
    case stories([Int])

    /// Return only series which have comics that take place during the specified events.
    case events([Int])

    /// Return only series which feature work by the specified creators.
    case creators([Int])

    /// Return only series which feature the specified characters.
    case characters([Int])

    /// Filter the series by publication frequency type.
    case seriesType(Type)

    /// Return only series containing one or more comics with the specified format.
    case contains([ComicParameter.IssueFormat])

    /// Order the result set by a field or fields.
    /// Multiple values are given priority in the order in which they are passed.
    case orderBy([Order])

    /// Limit the result set to the specified number of resources.
    case limit(Int)

    /// Skip the specified number of resources in the result set.
    case offset(Int)

}

extension SeriesParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .title:
                return "title"
            case .titleStartsWith:
                return "titleStartsWith"
            case .startYear:
                return "startYear"
            case .modifiedSince:
                return "modifiedSince"
            case .comics:
                return "comics"
            case .stories:
                return "stories"
            case .events:
                return "events"
            case .creators:
                return "creators"
            case .characters:
                return "characters"
            case .seriesType:
                return "seriesType"
            case .contains:
                return "contains"
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
            case let .title(value):
                return value
            case let .titleStartsWith(value):
                return value
            case let .startYear(value):
                return "\(value)"
            case let .modifiedSince(value):
                return value.string
            case let .comics(value):
                return value.csv
            case let .stories(value):
                return value.csv
            case let .events(value):
                return value.csv
            case let .creators(value):
                return value.csv
            case let .characters(value):
                return value.csv
            case let .seriesType(value):
                return value.rawValue
            case let .contains(value):
                return value.map({ $0.rawValue }).csv
            case let .orderBy(value):
                return value.map({ $0.rawValue }).csv
            case let .limit(value):
                return "\(value)"
            case let .offset(value):
                return "\(value)"
        }
    }

}
