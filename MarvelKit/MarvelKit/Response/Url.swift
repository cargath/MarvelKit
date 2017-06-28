//
//  Url.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 28.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Url

public struct Url: Codable {

    /// A text identifier for the URL.
    public let type: String?

    /// A full URL (including scheme, domain, and path).
    public let url: String?

}
