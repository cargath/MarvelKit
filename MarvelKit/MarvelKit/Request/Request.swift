//
//  Request.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public typealias DataResourceProtocol = DataProtocol & ResourceProtocol

open class Request<Resource: DataResourceProtocol> {

    var url: URL?

    var defaultSession: URLSession {
        return URLSession(configuration: .default)
    }

    // MARK: Internal initializers

    init(resource: Resource.Type, authentication: Authentication) {
        url = resource.absoluteURL()?.byAppendingParameters(authentication.params())
    }

    init(resource: Resource.Type, authentication: Authentication, id: Int) {
        url = resource.absoluteURL(id: id)?.byAppendingParameters(authentication.params())
    }

    init(resource: Resource.Type, authentication: Authentication, filter: ResourceFilter<Resource.ResourceFilterType>) {
        url = resource.absoluteURL(filter: filter)?.byAppendingParameters(authentication.params())
    }

    // MARK: Public builders

    open func withParameters(_ parameters: [Resource.ResourceParameterType]) -> Request<Resource> {
        url = url?.byAppendingParameters(parameters.urlParameters)
        return self
    }

    open func exec(success successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void, error errorHandler: @escaping (MarvelKitError) -> Void) {

        guard let url = self.url else {
            return errorHandler(.nsurlError(msg: "Failed to create URL for resource"))
        }

        defaultSession.resourceTaskWithURL(url, successHandler: { response, resource in
            successHandler(resource)
        }, errorHandler: { response, error in
            errorHandler(error)
        }).resume()
    }
    
}
