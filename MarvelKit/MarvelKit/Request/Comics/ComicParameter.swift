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
    case Format(value: IssueFormat)

    /**
     * Filter by the issue format type (comic or collection).
     */
    case FormatType(value: IssueFormatType)

    /**
     * Exclude variants (alternate covers, secondary printings, director's cuts, etc.) from the result set.
     */
    case NoVariants(value: Bool)

    /**
     * Return comics within a predefined date range.
     */
    case DateDescriptor(value: PredefinedDateDescriptor)

    /**
     * Return comics within a date range.
     */
    case DateRange(date1: NSDate, date2: NSDate)

    /**
     * Return only issues in series whose title matches the input.
     */
    case Title(value: String)

    /**
     * Return only issues in series whose title starts with the input.
     */
    case TitleStartsWith(value: String)

    /**
     * Return only issues in series whose start year matches the input.
     */
    case StartYear(value: Int)

    /**
     * Return only issues in series whose issue number matches the input.
     */
    case IssueNumber(value: Int)

    /**
     * Filter by diamond code.
     */
    case DiamondCode(value: String)

    /**
     * Filter by digital comic id.
     */
    case DigitalID(value: Int)

    /**
     * Filter by UPC.
     */
    case UPC(value: String)

    /**
     * Filter by ISBN.
     */
    case ISBN(value: String)

    /**
     * Filter by EAN.
     */
    case EAN(value: String)

    /**
     * Filter by ISSN.
     */
    case ISSN(value: String)

    /**
     * Include only results which are available digitally.
     */
    case HasDigitalIssue(value: Bool)

    /**
     * Return only comics which have been modified since the specified date.
     */
    case ModifiedSince(value: NSDate)

    /**
     * Return only comics which feature work by the specified creators ids.
     */
    case Creators(value: [Int])

    /**
     * Return only comics which feature the specified characters ids.
     */
    case Characters(value: [Int])

    /**
     * Return only comics which are part of the specified series ids.
     */
    case Series(value: [Int])

    /**
     * Return only comics which take place in the specified events ids.
     */
    case Events(value: [Int])

    /**
     * Return only comics which contain the specified stories ids.
     */
    case Stories(value: [Int])

    /**
     * Return only comics in which the specified characters appear together (for example in which BOTH Spider-Man and Wolverine appear).
     */
    case SharedAppearances(value: [Int])

    /**
     * Return only comics in which the specified creators worked together (for example in which BOTH Stan Lee and Jack Kirby did work).
     */
    case Collaborators(value: [Int])

    /**
     * Order the result set by a field or fields. Multiple values are given priority in the order in which they are passed.
     */
    case OrderBy(value: [Order])

    /**
     * Limit the result set to the specified number of resources.
     */
    case Limit(value: Int)

    /**
     * Skip the specified number of resources in the result set.
     */
    case Offset(value: Int)

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
