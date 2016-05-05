//
//  ComicFilter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum ComicFilter: String {

    case Characters = "characters"
    case Creators = "creators"
    case Events = "events"
    case Stories = "stories"

}

extension ComicFilter: ResourceFilterProtocol {

    public var name: String {
        return rawValue
    }
    
}
