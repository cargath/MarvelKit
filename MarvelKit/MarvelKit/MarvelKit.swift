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

public class MarvelKit {

    let defaultSession = NSURLSession(configuration: .defaultSessionConfiguration())

    let account: Account

    // MARK: Initialize with developer credentials

    public init(privateKey: String, publicKey: String) {
        self.account = Account(privateKey: privateKey, publicKey: publicKey)
    }

    // MARK: Generate requests

    public func request<Resource: DataResourceProtocol>(resource: Resource.Type) -> Request<Resource> {
        return Request(resource: resource, authentication: account)
    }

    public func request<Resource: DataResourceProtocol>(resource: Resource.Type, id: Int) -> Request<Resource> {
        return Request(resource: resource, authentication: account, id: id)
    }

    public func request<Resource: DataResourceProtocol>(resource: Resource.Type, filter: ResourceFilter<Resource.ResourceFilterType>) -> Request<Resource> {
        return Request(resource: resource, authentication: account, filter: filter)
    }

}
