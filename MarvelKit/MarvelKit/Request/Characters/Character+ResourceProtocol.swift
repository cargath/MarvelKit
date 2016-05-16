//
//  Character+ResourceProtocol.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension Character: ResourceProtocol {

    public typealias ResourceFilterType = CharacterFilter

    public typealias ResourceParameterType = CharacterParameter

    public static var name: String {
        return "characters"
    }
    
}
