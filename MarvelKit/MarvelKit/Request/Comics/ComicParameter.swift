//
//  ComicParameter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum ComicParameter {

    public enum IssueFormat: String {

        case Comic = "comic"
        case Magazine = "magazine"
        case TradePaperback = "trade paperback"
        case Hardcover = "hardcover"
        case Digest = "digest"
        case GraphicNovel = "graphic novel"
        case DigitalComic = "digital comic"
        case InfiniteComic = "infinite comic"

    }

    public enum IssueFormatType: String {

        case Comic = "comic"
        case Collection = "collection"

    }

    public enum PredefinedDateDescriptor: String {

        case LastWeek = "lastWeek"
        case ThisWeek = "thisWeek"
        case NextWeek = "nextWeek"
        case ThisMonth = "thisMonth"
        
    }

    public enum Order: String {

        // FOC date
        case FOCDateAscending = "focDate"
        case FOCDateDescending = "-focDate"

        // on sale date
        case OnSaleDateAscending = "onsaleDate"
        case OnSaleDateDescending = "-onsaleDate"

        // title
        case TitleAscending = "title"
        case TitleDescending = "-title"

        // issue number
        case IssueNumberAscending = "issueNumber"
        case IssueNumberDescending = "-issueNumber"

        // modified since
        case ModifiedAscending = "modified"
        case ModifiedDescending = "-modified"
        
    }

    /**
     * Filter by the issue format (e.g. comic, digital comic, hardcover).
     */
    case format(IssueFormat)

    /**
     * Filter by the issue format type (comic or collection).
     */
    case formatType(IssueFormatType)

    /**
     * Exclude variants (alternate covers, secondary printings, director's cuts, etc.) from the result set.
     */
    case noVariants(Bool)

    /**
     * Return comics within a predefined date range.
     */
    case dateDescriptor(PredefinedDateDescriptor)

    /**
     * Return comics within a date range.
     */
    case dateRange(Date, Date)

    /**
     * Return only issues in series whose title matches the input.
     */
    case title(String)

    /**
     * Return only issues in series whose title starts with the input.
     */
    case titleStartsWith(String)

    /**
     * Return only issues in series whose start year matches the input.
     */
    case startYear(Int)

    /**
     * Return only issues in series whose issue number matches the input.
     */
    case issueNumber(Int)

    /**
     * Filter by diamond code.
     */
    case diamondCode(String)

    /**
     * Filter by digital comic id.
     */
    case digitalID(Int)

    /**
     * Filter by UPC.
     */
    case upc(String)

    /**
     * Filter by ISBN.
     */
    case isbn(String)

    /**
     * Filter by EAN.
     */
    case ean(String)

    /**
     * Filter by ISSN.
     */
    case issn(String)

    /**
     * Include only results which are available digitally.
     */
    case hasDigitalIssue(Bool)

    /**
     * Return only comics which have been modified since the specified date.
     */
    case modifiedSince(Date)

    /**
     * Return only comics which feature work by the specified creators ids.
     */
    case creators([Int])

    /**
     * Return only comics which feature the specified characters ids.
     */
    case characters([Int])

    /**
     * Return only comics which are part of the specified series ids.
     */
    case series([Int])

    /**
     * Return only comics which take place in the specified events ids.
     */
    case events([Int])

    /**
     * Return only comics which contain the specified stories ids.
     */
    case stories([Int])

    /**
     * Return only comics in which the specified characters appear together (for example in which BOTH Spider-Man and Wolverine appear).
     */
    case sharedAppearances([Int])

    /**
     * Return only comics in which the specified creators worked together (for example in which BOTH Stan Lee and Jack Kirby did work).
     */
    case collaborators([Int])

    /**
     * Order the result set by a field or fields.
     * Multiple values are given priority in the order in which they are passed.
     */
    case orderBy([Order])

    /**
     * Limit the result set to the specified number of resources.
     */
    case limit(Int)

    /**
     * Skip the specified number of resources in the result set.
     */
    case offset(Int)

}

extension ComicParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .format:
                return "format"
            case .formatType:
                return "formatType"
            case .noVariants:
                return "noVariants"
            case .dateDescriptor:
                return "dateDescriptor"
            case .dateRange:
                return "dateRange"
            case .title:
                return "title"
            case .titleStartsWith:
                return "titleStartsWith"
            case .startYear:
                return "startYear"
            case .issueNumber:
                return "issueNumber"
            case .diamondCode:
                return "diamondCode"
            case .digitalID:
                return "digitalId"
            case .upc:
                return "upc"
            case .isbn:
                return "isbn"
            case .ean:
                return "ean"
            case .issn:
                return "issn"
            case .hasDigitalIssue:
                return "hasDigitalIssue"
            case .modifiedSince:
                return "modifiedSince"
            case .creators:
                return "creators"
            case .characters:
                return "characters"
            case .series:
                return "series"
            case .events:
                return "events"
            case .stories:
                return "stories"
            case .sharedAppearances:
                return "sharedAppearances"
            case .collaborators:
                return "collaborators"
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
            case let .format(value):
                return value.rawValue
            case let .formatType(value):
                return value.rawValue
            case let .noVariants(value):
                return value ? "true" : "false"
            case let .dateDescriptor(value):
                return value.rawValue
            case let .dateRange(date1, date2):
                return "\(date1.string),\(date2.string)"
            case let .title(value):
                return value
            case let .titleStartsWith(value):
                return value
            case let .startYear(value):
                return "\(value)"
            case let .issueNumber(value):
                return "\(value)"
            case let .diamondCode(value):
                return value
            case let .digitalID(value):
                return "\(value)"
            case let .upc(value):
                return value
            case let .isbn(value):
                return value
            case let .ean(value):
                return value
            case let .issn(value):
                return value
            case let .hasDigitalIssue(value):
                return value ? "true" : "false"
            case let .modifiedSince(value):
                return value.string
            case let .creators(value):
                return value.csv
            case let .characters(value):
                return value.csv
            case let .series(value):
                return value.csv
            case let .events(value):
                return value.csv
            case let .stories(value):
                return value.csv
            case let .sharedAppearances(value):
                return value.csv
            case let .collaborators(value):
                return value.csv
            case let .orderBy(value):
                return value.flatMap({ $0.rawValue }).csv
            case let .limit(value):
                return "\(value)"
            case let .offset(value):
                return "\(value)"
        }
    }
    
}
