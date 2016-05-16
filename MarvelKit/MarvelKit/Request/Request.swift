//
//  Request.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public typealias DataResourceProtocol = protocol<DataProtocol, ResourceProtocol>

public class Request<Resource: DataResourceProtocol> {

    var url: NSURL?

    var defaultSession: NSURLSession {
        return NSURLSession(configuration: .defaultSessionConfiguration())
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

    public func withParameters(parameters: [Resource.ResourceParameterType]) -> Request<Resource> {
        url = url?.byAppendingParameters(parameters.urlParameters)
        return self
    }

    public func exec(success successHandler: DataWrapper<DataContainer<Resource>> -> Void, error errorHandler: MarvelKitError -> Void) {

        guard let url = self.url else {
            return errorHandler(.NSURLError(msg: "Failed to create URL for resource"))
        }

        defaultSession.resourceTaskWithURL(url, successHandler: { response, resource in
            successHandler(resource)
        }, errorHandler: { response, error in
            errorHandler(error)
        }).resume()
    }
    
}
