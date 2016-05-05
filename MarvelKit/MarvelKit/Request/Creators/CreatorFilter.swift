//
//  CreatorFilter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public enum CreatorFilter: String {

    case Comics = "comics"
    case Events = "events"
    case Series = "series"
    case Stories = "stories"

}

extension CreatorFilter: ResourceFilterProtocol {

    public var name: String {
        return rawValue
    }
    
}
