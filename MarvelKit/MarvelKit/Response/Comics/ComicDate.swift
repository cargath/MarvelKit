//
//  ComicDate.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - ComicDateType

// TODO: Make Codable
// TODO: Make Subtype of ComicData?
public enum ComicDateType: String {

    case focDate = "focDate"
    case onsaleDate = "onsaleDate"
    case unlimitedDate = "unlimitedDate"

}

// MARK: - ComicDate

public struct ComicDate: Codable {

    /**
     * A description of the date (e.g. onsale date, FOC date).
     */
    public let type: String?

    /**
     * The date.
     */
    public let date: String?

}
