//
//  URLSession+Tasks.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

public enum MarvelKitError: Swift.Error {
    
    case URLSessionError(msg: String)
    case URLError(msg: String)

}

public extension URLSession {
    
    private func failingTask(_ errorHandler: @escaping (Swift.Error) -> Void) -> URLSessionTask {
        return dataTask(with: URL(fileURLWithPath: "")) { _, _, _ in
            errorHandler(MarvelKitError.URLError(msg: "Failed to create URL for resource"))
        }
    }

    private func errorTask(_ error: Swift.Error, errorHandler: @escaping (Swift.Error) -> Void) -> URLSessionTask {
        return dataTask(with: URL(fileURLWithPath: "")) { _, _, _ in
            errorHandler(error)
        }
    }

}

public extension URLSession {

    private func resourceTask<Resource>(with url: URL, errorHandler: @escaping (Swift.Error) -> Void, successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void) -> URLSessionDataTask {
        return jsonTask(with: url, decoder: .init(), successHandler: successHandler, failureHandler: { (marvelKitError: MarvelKit.Error?, response: URLResponse?, error: Swift.Error?) in

            if let marvelKitError = marvelKitError {
                errorHandler(marvelKitError)
                return
            }

            if let error = error {
                errorHandler(MarvelKit.Error(message: error.localizedDescription, code: "\((error as NSError).code)"))
                return
            }

            if let response = response as? HTTPURLResponse {
                errorHandler(MarvelKit.Error(message: HTTPURLResponse.localizedString(forStatusCode: response.statusCode), code: "\(response.statusCode)"))
                return
            }

            errorHandler(MarvelKit.Error(message: "unknown", code: "0"))
        })
    }

    public func resourceTask<Resource>(with request: Request<Resource>, success successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void, error errorHandler: @escaping (Swift.Error) -> Void) -> URLSessionTask {
        if let url = request.url {
            return resourceTask(with: url, errorHandler: errorHandler, successHandler: successHandler)
        } else {
            return failingTask(errorHandler)
        }
    }
    
}
