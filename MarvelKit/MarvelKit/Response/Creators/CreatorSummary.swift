//
//  CreatorSummary.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Summary implementation

public struct CreatorSummary: SummaryProtocol {

    /// The path to the individual creator resource.
    public let resourceURI: String?

    /// The full name of the creator.
    public let name: String?

    /// The role of the creator in the parent entity.
    public let role: String?

}

// MARK: - Typealias used in the Marvel API docs

public typealias CreatorList = List<CreatorSummary>
