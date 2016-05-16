//
//  CreatorParameter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum CreatorParameter {

    public enum Order: String {

        // First name
        case FirstNameAscending = "firstName"
        case FirstNameDescending = "-firstName"

        // Middle name
        case MiddleNameAscending = "middleName"
        case MiddleNameDescending = "-middleName"

        // Last name
        case LastNameAscending = "lastName"
        case LastNameDescending = "-lastName"

        // Suffix
        case SuffixAscending = "suffix"
        case SuffixDescending = "-suffix"

        // modified since
        case ModifiedAscending = "modified"
        case ModifiedDescending = "-modified"
        
    }

    /**
     * Filter by creator first name (e.g. Brian).
     */
    case FirstName(String)

    /**
     * Filter by creator middle name (e.g. Michael).
     */
    case MiddleName(String)

    /**
     * Filter by creator last name (e.g. Bendis).
     */
    case LastName(String)

    /**
     * Filter by suffix or honorific (e.g. Jr., Sr.).
     */
    case Suffix(String)

    /**
     * Filter by creator names that match critera (e.g. B, St L).
     */
    case NameStartsWith(String)

    /**
     * Filter by creator first names that match critera (e.g. B, St L).
     */
    case FirstNameStartsWith(String)

    /**
     * Filter by creator middle names that match critera (e.g. Mi).
     */
    case MiddleNameStartsWith(String)

    /**
     * Filter by creator last names that match critera (e.g. Ben).
     */
    case LastNameStartsWith(String)

    /**
     * Return only creators which have been modified since the specified date.
     */
    case ModifiedSince(NSDate)

    /**
     * Return only creators who worked on in the specified comics.
     */
    case Comics([Int])

    /**
     * Return only creators who worked on the specified series.
     */
    case Series([Int])

    /**
     * Return only creators who worked on comics that took place in the specified events.
     */
    case Events([Int])

    /**
     * Return only creators who worked on the specified stories.
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

extension CreatorParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .FirstName:
                return "firstName"
            case .MiddleName:
                return "middleName"
            case .LastName:
                return "lastName"
            case .Suffix:
                return "suffix"
            case .NameStartsWith:
                return "nameStartsWith"
            case .FirstNameStartsWith:
                return "firstNameStartsWith"
            case .MiddleNameStartsWith:
                return "middleNameStartsWith"
            case .LastNameStartsWith:
                return "lastNameStartsWith"
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
            case let .FirstName(value):
                return value
            case let .MiddleName(value):
                return value
            case let .LastName(value):
                return value
            case let .Suffix(value):
                return value
            case let .NameStartsWith(value):
                return value
            case let .FirstNameStartsWith(value):
                return value
            case let .MiddleNameStartsWith(value):
                return value
            case let .LastNameStartsWith(value):
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
