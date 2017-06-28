//
//  SeriesSummary.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Summary implementation

public struct SeriesSummary: SummaryProtocol {

    /// The path to the individual series resource.
    public let resourceURI: String?

    /// The canonical name of the series.
    public let name: String?
    
}

// MARK: - Typealias used in the Marvel API docs

public typealias SeriesList = List<SeriesSummary>
