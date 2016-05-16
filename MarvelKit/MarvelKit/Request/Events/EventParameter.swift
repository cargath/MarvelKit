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
        case NameAscending = "nameDate"
        case NameDescending = "-nameDate"

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
        return "key"
    }

    public var value: String {
        return "value"
    }
    
}
