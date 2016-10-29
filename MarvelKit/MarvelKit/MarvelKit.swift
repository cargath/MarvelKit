//
//  MarvelKit.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 05.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

// MARK: - Authorized developer account

struct Account: Authentication {

    let privateKey: String

    let publicKey: String

}

// MARK: - MarvelKit

open class MarvelKit {

    let defaultSession = URLSession(configuration: .default)

    let account: Account

    // MARK: Initialize with developer credentials

    public init(privateKey: String, publicKey: String) {
        self.account = Account(privateKey: privateKey, publicKey: publicKey)
    }

    // MARK: Generate requests

    open func request<Resource: DataResourceProtocol>(_ resource: Resource.Type) -> Request<Resource> {
        return Request(resource: resource, authentication: account)
    }

    open func request<Resource: DataResourceProtocol>(_ resource: Resource.Type, id: Int) -> Request<Resource> {
        return Request(resource: resource, authentication: account, id: id)
    }

    open func request<Resource: DataResourceProtocol>(_ resource: Resource.Type, filter: ResourceFilter<Resource.ResourceFilterType>) -> Request<Resource> {
        return Request(resource: resource, authentication: account, filter: filter)
    }

}
