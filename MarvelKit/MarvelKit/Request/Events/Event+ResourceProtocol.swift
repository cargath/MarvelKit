//
//  Event+ResourceProtocol.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension Event: ResourceProtocol {

    public typealias ResourceFilterType = EventFilter

    public typealias ResourceParameterType = EventParameter

    public static var name: String {
        return "events"
    }
    
}
