//
//  Data.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Data interface

public protocol DataProtocol: JSONObjectConvertible {

    var id: Int? { get }

    var resourceURI: String? { get }
    
    var modified: String? { get }

}

// MARK: - DataProtocol + modified date

public extension DataProtocol {
    
    public var modifiedDate: Date? {
        return modified?.iso8601Date
    }
    
}
