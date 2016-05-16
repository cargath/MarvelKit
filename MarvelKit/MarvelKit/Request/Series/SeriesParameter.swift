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
        return "key"
    }

    public var value: String {
        return "value"
    }
    
}
