//
//  Creator+ResourceProtocol.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension Creator: ResourceProtocol {

    public typealias ResourceFilterType = CreatorFilter

    public typealias ResourceParameterType = CreatorParameter

    public static var name: String {
        return "creators"
    }
    
}
