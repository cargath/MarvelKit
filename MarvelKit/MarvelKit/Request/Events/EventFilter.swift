//
//  EventFilter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum EventFilter: String {

    case Characters = "characters"
    case Comics = "comics"
    case Creators = "creators"
    case Series = "series"
    case Stories = "stories"

}

extension EventFilter: ResourceFilterProtocol {

    public var name: String {
        return rawValue
    }
    
}
