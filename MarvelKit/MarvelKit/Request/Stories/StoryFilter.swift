//
//  StoryFilter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum StoryFilter: String {

    case Characters = "characters"
    case Comics = "comics"
    case Creators = "creators"
    case Events = "events"
    case Series = "series"

}

extension StoryFilter: ResourceFilterProtocol {

    public var name: String {
        return rawValue
    }
    
}
