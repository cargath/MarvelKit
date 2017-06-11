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
        url = resource.absoluteURL()?.appendingParameters(authentication.params())
    }

    init(resource: Resource.Type, authentication: Authentication, id: Int) {
        url = resource.absoluteURL(id: id)?.appendingParameters(authentication.params())
    }

    init(resource: Resource.Type, authentication: Authentication, filter: ResourceFilter<Resource.ResourceFilterType>) {
        url = resource.absoluteURL(filter: filter)?.appendingParameters(authentication.params())
    }

    // MARK: Public builders

    public func withParameters(_ parameters: [Resource.ResourceParameterType]) -> Request<Resource> {
        url = url?.appendingParameters(parameters.urlParameters)
        return self
    }
    
    public func resourceTask(success successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void, error errorHandler: @escaping (MarvelKitError) -> Void) -> URLSessionTask {
        
        guard let url = self.url else {
            return URLSession.shared.failingTask(errorHandler)
        }
        
        return URLSession.shared.resourceTaskWithURL(url, successHandler: { response, resource in
            successHandler(resource)
        }, errorHandler: { response, error in
            errorHandler(error)
        })
    }

    public func exec(success successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void, error errorHandler: @escaping (MarvelKitError) -> Void) {
        resourceTask(success: successHandler, error: errorHandler).resume()
    }
    
}
