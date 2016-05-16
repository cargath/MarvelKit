//
//  StoryParameter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum StoryParameter {

    public enum Order: String {

        // id
        case IDAscending = "id"
        case IDDescending = "-id"

        // modified since
        case ModifiedAscending = "modified"
        case ModifiedDescending = "-modified"
        
    }

    /**
     * Return only stories which have been modified since the specified date.
     */
    case ModifiedSince(NSDate)

    /**
     * Return only stories contained in the specified comics.
     */
    case Comics([Int])

    /**
     * Return only stories contained the specified series.
     */
    case Series([Int])

    /**
     * Return only stories which take place during the specified events.
     */
    case Events([Int])

    /**
     * Return only stories which feature work by the specified creators.
     */
    case Creators([Int])

    /**
     * Return only stories which feature the specified characters.
     */
    case Characters([Int])

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

extension StoryParameter: ResourceParameterProtocol {

    public var key: String {
        return "key"
    }

    public var value: String {
        return "value"
    }
    
}
