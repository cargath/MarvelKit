//
//  Comic+ResourceProtocol.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension Comic: ResourceProtocol {

    public typealias ResourceFilterType = ComicFilter

    public typealias ResourceParameterType = ComicParameter

    public static var name: String {
        return "comics"
    }
    
}
