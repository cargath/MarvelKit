//
//  SeriesFilter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum SeriesFilter: String {

    case Characters = "characters"
    case Comics = "comics"
    case Creators = "creators"
    case Events = "events"
    case Stories = "stories"

}

extension SeriesFilter: ResourceFilterProtocol {

    public var name: String {
        return rawValue
    }
    
}
