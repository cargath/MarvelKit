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
    case Format(IssueFormat)

    /**
     * Filter by the issue format type (comic or collection).
     */
    case FormatType(IssueFormatType)

    /**
     * Exclude variants (alternate covers, secondary printings, director's cuts, etc.) from the result set.
     */
    case NoVariants(Bool)

    /**
     * Return comics within a predefined date range.
     */
    case DateDescriptor(PredefinedDateDescriptor)

    /**
     * Return comics within a date range.
     */
    case DateRange(NSDate, NSDate)

    /**
     * Return only issues in series whose title matches the input.
     */
    case Title(String)

    /**
     * Return only issues in series whose title starts with the input.
     */
    case TitleStartsWith(String)

    /**
     * Return only issues in series whose start year matches the input.
     */
    case StartYear(Int)

    /**
     * Return only issues in series whose issue number matches the input.
     */
    case IssueNumber(Int)

    /**
     * Filter by diamond code.
     */
    case DiamondCode(String)

    /**
     * Filter by digital comic id.
     */
    case DigitalID(Int)

    /**
     * Filter by UPC.
     */
    case UPC(String)

    /**
     * Filter by ISBN.
     */
    case ISBN(String)

    /**
     * Filter by EAN.
     */
    case EAN(String)

    /**
     * Filter by ISSN.
     */
    case ISSN(String)

    /**
     * Include only results which are available digitally.
     */
    case HasDigitalIssue(Bool)

    /**
     * Return only comics which have been modified since the specified date.
     */
    case ModifiedSince(NSDate)

    /**
     * Return only comics which feature work by the specified creators ids.
     */
    case Creators([Int])

    /**
     * Return only comics which feature the specified characters ids.
     */
    case Characters([Int])

    /**
     * Return only comics which are part of the specified series ids.
     */
    case Series([Int])

    /**
     * Return only comics which take place in the specified events ids.
     */
    case Events([Int])

    /**
     * Return only comics which contain the specified stories ids.
     */
    case Stories([Int])

    /**
     * Return only comics in which the specified characters appear together (for example in which BOTH Spider-Man and Wolverine appear).
     */
    case SharedAppearances([Int])

    /**
     * Return only comics in which the specified creators worked together (for example in which BOTH Stan Lee and Jack Kirby did work).
     */
    case Collaborators([Int])

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

extension ComicParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .Format:
                return "format"
            case .FormatType:
                return "formatType"
            case .NoVariants:
                return "noVariants"
            case .DateDescriptor:
                return "dateDescriptor"
            case .DateRange:
                return "dateRange"
            case .Title:
                return "title"
            case .TitleStartsWith:
                return "titleStartsWith"
            case .StartYear:
                return "startYear"
            case .IssueNumber:
                return "issueNumber"
            case .DiamondCode:
                return "diamondCode"
            case .DigitalID:
                return "digitalId"
            case .UPC:
                return "upc"
            case .ISBN:
                return "isbn"
            case .EAN:
                return "ean"
            case .ISSN:
                return "issn"
            case .HasDigitalIssue:
                return "hasDigitalIssue"
            case .ModifiedSince:
                return "modifiedSince"
            case .Creators:
                return "creators"
            case .Characters:
                return "characters"
            case .Series:
                return "series"
            case .Events:
                return "events"
            case .Stories:
                return "stories"
            case .SharedAppearances:
                return "sharedAppearances"
            case .Collaborators:
                return "collaborators"
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
            case let .Format(value):
                return value.rawValue
            case let .FormatType(value):
                return value.rawValue
            case let .NoVariants(value):
                return value ? "true" : "false"
            case let .DateDescriptor(value):
                return value.rawValue
            case let .DateRange(date1, date2):
                return "\(date1.string),\(date2.string)"
            case let .Title(value):
                return value
            case let .TitleStartsWith(value):
                return value
            case let .StartYear(value):
                return "\(value)"
            case let .IssueNumber(value):
                return "\(value)"
            case let .DiamondCode(value):
                return value
            case let .DigitalID(value):
                return "\(value)"
            case let .UPC(value):
                return value
            case let .ISBN(value):
                return value
            case let .EAN(value):
                return value
            case let .ISSN(value):
                return value
            case let .HasDigitalIssue(value):
                return value ? "true" : "false"
            case let .ModifiedSince(value):
                return value.string
            case let .Creators(value):
                return value.csv
            case let .Characters(value):
                return value.csv
            case let .Series(value):
                return value.csv
            case let .Events(value):
                return value.csv
            case let .Stories(value):
                return value.csv
            case let .SharedAppearances(value):
                return value.csv
            case let .Collaborators(value):
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
