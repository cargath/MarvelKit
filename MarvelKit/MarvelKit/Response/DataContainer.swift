//
//  DataContainer.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Data container interface

public protocol DataContainerProtocol: JSONObjectConvertible {

    associatedtype DataProtocolType: DataProtocol

}

// MARK: - Data container implementation

public struct DataContainer<DataType: DataProtocol>: DataContainerProtocol {

    public typealias DataProtocolType = DataType

    /**
     * The requested offset (number of skipped results) of the call.
     */
    public let offset: Int?

    /**
     * The requested result limit.
     */
    public let limit: Int?

    /**
     * The total number of resources available given the current filter set.
     */
    public let total: Int?

    /**
     * The total number of results returned by this call.
     */
    public let count: Int?

    /**
     * The list of results returned by the call.
     */
    public let results: [DataType]

}

// MARK: - Data container + JSONObjectConvertible

extension DataContainer {

    public init?(JSONObject: JSONObject) {
        self.offset = JSONObject["offset"] as? Int
        self.limit = JSONObject["limit"] as? Int
        self.total = JSONObject["total"] as? Int
        self.count = JSONObject["count"] as? Int
        self.results = DataType.from(JSONArray: JSONObject["results"] as? JSONArray)
    }

}
