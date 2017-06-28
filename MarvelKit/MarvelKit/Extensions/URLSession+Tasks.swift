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

public extension MarvelKitError {

    var description: String {
        switch self {
            case let .URLSessionError(msg):
                return msg
            case let .URLError(msg):
                return msg
        }
    }

}

public extension URLSession {
    
    private func failingTask(_ errorHandler: @escaping (Swift.Error) -> Void) -> URLSessionTask {
        // TODO return dataTask(with: URL(fileURLWithPath: "")) { _ in
        return dataTask(with: URL(fileURLWithPath: "")) { (_, _, _) in
            errorHandler(MarvelKitError.URLError(msg: "Failed to create URL for resource"))
        }
    }
    
    private func dataTask(with url: URL, errorHandler: @escaping (Swift.Error) -> Void, successHandler: @escaping (HTTPURLResponse, Data) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { data, response, error in
            
            if let error = error {
                return errorHandler(MarvelKitError.URLSessionError(msg: error.localizedDescription))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return errorHandler(MarvelKitError.URLSessionError(msg: "Failed to receive response"))
            }
            
            guard let data = data else {
                return errorHandler(MarvelKitError.URLSessionError(msg: "Failed to receive data"))
            }
            
            return successHandler(response, data)
        }
    }
    
    private func resourceTask<Resource>(with url: URL, errorHandler: @escaping (Swift.Error) -> Void, successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url, errorHandler: errorHandler) { response, data in
            
            let decoder = JSONDecoder()
            
            do {
                if response.statusCode == 200 {
                    return successHandler(try decoder.decode(DataWrapper<DataContainer<Resource>>.self, from: data))
                } else {
                    return errorHandler(try decoder.decode(MarvelKit.Error.self, from: data))
                }
            } catch {
                return errorHandler(error)
            }
        }
    }
    
    public func resourceTask<Resource>(with request: Request<Resource>, success successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void, error errorHandler: @escaping (Swift.Error) -> Void) -> URLSessionTask {
        if let url = request.url {
            return resourceTask(with: url, errorHandler: errorHandler, successHandler: successHandler)
        } else {
            return failingTask(errorHandler)
        }
    }
    
}
