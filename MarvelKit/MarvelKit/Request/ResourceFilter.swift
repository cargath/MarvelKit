//
//  ResourceFilter.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - ResourceFilterProtocol

public protocol ResourceFilterProtocol {

    var name: String { get }

}

public extension ResourceFilterProtocol {

    func pathComponent(id: Int) -> String {
        return "\(name)/\(id)"
    }
    
}

// MARK: - ResourceFilter

public struct ResourceFilter<ResourceFilterType: ResourceFilterProtocol> {

    public var name: String
    public var id: Int

    public init(_ filter: ResourceFilterType, id: Int) {
        self.name = filter.name
        self.id = id
    }

    public var pathComponent: String {
        return "\(name)/\(id)"
    }
    
}
