//
//  Story+ResourceProtocol.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension Story: ResourceProtocol {

    public typealias ResourceFilterType = StoryFilter

    public typealias ResourceParameterType = StoryParameter

    public static var name: String {
        return "stories"
    }
    
}
