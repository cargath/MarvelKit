//
//  Request.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public typealias DataResourceProtocol = DataProtocol & ResourceProtocol

public class Request<Resource: DataResourceProtocol> {

    var url: URL?

    // MARK: Internal initializers

    init(resource: Resource.Type, authentication: Authentication) {
        url = resource.absoluteURL()?.appendingQueryItems(authentication.queryItems())
    }

    init(resource: Resource.Type, authentication: Authentication, id: Int) {
        url = resource.absoluteURL(id: id)?.appendingQueryItems(authentication.queryItems())
    }

    init(resource: Resource.Type, authentication: Authentication, filter: ResourceFilter<Resource.ResourceFilterType>) {
        url = resource.absoluteURL(filter: filter)?.appendingQueryItems(authentication.queryItems())
    }

    // MARK: Public builders

    public func withParameters(_ parameters: [Resource.ResourceParameterType]) -> Request<Resource> {
        url = url?.appendingQueryItems(parameters.urlQueryItems)
        return self
    }
    
}
