//
//  ComicDate.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct ComicDate: Codable {
    
    public enum DateType: String {
        
        case focDate = "focDate"
        case onsaleDate = "onsaleDate"
        case unlimitedDate = "unlimitedDate"
        
    }

    /// A description of the date (e.g. onsale date, FOC date).
    public let type: String?

    /// The date.
    public let date: String?

}
