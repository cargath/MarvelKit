//
//  List.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - List interface

public protocol ListProtocol {

    associatedtype SummaryProtocolType: SummaryProtocol

}

// MARK: - List implementation

public struct List<SummaryType: SummaryProtocol>: ListProtocol, Codable {

    public typealias SummaryProtocolType = SummaryType

    /// The number of total available resources in this list.
    /// Will always be greater than or equal to the "returned" value.
    public let available: Int?

    /// The number of resources returned in this collection (up to 20).
    public let returned: Int?

    /// The path to the full list of resources in this collection.
    public let collectionURI: String?

    /// The list of returned resourced in this collection.
    public let items: [SummaryType]?

}
