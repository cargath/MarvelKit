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
    case firstName(String)

    /**
     * Filter by creator middle name (e.g. Michael).
     */
    case middleName(String)

    /**
     * Filter by creator last name (e.g. Bendis).
     */
    case lastName(String)

    /**
     * Filter by suffix or honorific (e.g. Jr., Sr.).
     */
    case suffix(String)

    /**
     * Filter by creator names that match critera (e.g. B, St L).
     */
    case nameStartsWith(String)

    /**
     * Filter by creator first names that match critera (e.g. B, St L).
     */
    case firstNameStartsWith(String)

    /**
     * Filter by creator middle names that match critera (e.g. Mi).
     */
    case middleNameStartsWith(String)

    /**
     * Filter by creator last names that match critera (e.g. Ben).
     */
    case lastNameStartsWith(String)

    /**
     * Return only creators which have been modified since the specified date.
     */
    case modifiedSince(Date)

    /**
     * Return only creators who worked on in the specified comics.
     */
    case comics([Int])

    /**
     * Return only creators who worked on the specified series.
     */
    case series([Int])

    /**
     * Return only creators who worked on comics that took place in the specified events.
     */
    case events([Int])

    /**
     * Return only creators who worked on the specified stories.
     */
    case stories([Int])

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

extension CreatorParameter: ResourceParameterProtocol {

    public var key: String {
        switch self {
            case .firstName:
                return "firstName"
            case .middleName:
                return "middleName"
            case .lastName:
                return "lastName"
            case .suffix:
                return "suffix"
            case .nameStartsWith:
                return "nameStartsWith"
            case .firstNameStartsWith:
                return "firstNameStartsWith"
            case .middleNameStartsWith:
                return "middleNameStartsWith"
            case .lastNameStartsWith:
                return "lastNameStartsWith"
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
            case let .firstName(value):
                return value
            case let .middleName(value):
                return value
            case let .lastName(value):
                return value
            case let .suffix(value):
                return value
            case let .nameStartsWith(value):
                return value
            case let .firstNameStartsWith(value):
                return value
            case let .middleNameStartsWith(value):
                return value
            case let .lastNameStartsWith(value):
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
                return value.flatMap({ $0.rawValue }).csv
            case let .limit(value):
                return "\(value)"
            case let .offset(value):
                return "\(value)"
        }
    }
    
}
