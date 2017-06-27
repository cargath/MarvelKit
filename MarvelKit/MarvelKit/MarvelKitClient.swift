//
//  MarvelKitClient.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 01/01/2017.
//  Copyright © 2017 cargath. All rights reserved.
//

import Foundation

// MARK: - Authorized developer account

struct Account: Authentication {

    let privateKey: String

    let publicKey: String

}

// MARK: - MarvelKitClient

public class MarvelKitClient {

    let defaultSession = URLSession(configuration: .default)

    let account: Account

    // MARK: Initialize with developer credentials

    public init(privateKey: String, publicKey: String) {
        self.account = Account(privateKey: privateKey, publicKey: publicKey)
    }

    // MARK: Generate requests

    public func request<Resource>(_ resource: Resource.Type) -> Request<Resource> {
        return Request(resource: resource, authentication: account)
    }

    public func request<Resource>(_ resource: Resource.Type, id: Int) -> Request<Resource> {
        return Request(resource: resource, authentication: account, id: id)
    }

    public func request<Resource>(_ resource: Resource.Type, filter: ResourceFilter<Resource.ResourceFilterType>) -> Request<Resource> {
        return Request(resource: resource, authentication: account, filter: filter)
    }
    
}
