//
//  Series+ResourceProtocol.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension Series: ResourceProtocol {

    public typealias ResourceFilterType = SeriesFilter

    public typealias ResourceParameterType = SeriesParameter

    public static var name: String {
        return "series"
    }
    
}
