//
//  URLSession+MarvelKit.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

extension URLSession {

    private func dataTaskCompletionHandler<SuccessType: Decodable, FailureType: Decodable>(decoder: JSONDecoder, successHandler: @escaping (SuccessType) -> Void, failureHandler: @escaping (FailureType?, URLResponse?, Swift.Error?) -> Void) -> (Data?, URLResponse?, Swift.Error?) -> Void {
        return { data, response, error in

            guard let data = data else {
                failureHandler(nil, response, error)
                return
            }

            if let error = error {
                failureHandler(try? decoder.decode(FailureType.self, from: data), response, error)
                return
            }

            do {
                successHandler(try decoder.decode(SuccessType.self, from: data))
            } catch {
                if let failure = try? decoder.decode(FailureType.self, from: data) {
                    failureHandler(failure, response, nil)
                } else {
                    failureHandler(nil, response, error)
                }
            }
        }
    }

    public func jsonTask<SuccessType: Decodable, FailureType: Decodable>(with request: URLRequest, decoder: JSONDecoder, successHandler: @escaping (SuccessType) -> Void, failureHandler: @escaping (FailureType?, URLResponse?, Swift.Error?) -> Void) -> URLSessionDataTask {
        return dataTask(with: request, completionHandler: dataTaskCompletionHandler(decoder: decoder, successHandler: successHandler, failureHandler: failureHandler))
    }

    public func jsonTask<SuccessType: Decodable, FailureType: Decodable>(with url: URL, decoder: JSONDecoder, successHandler: @escaping (SuccessType) -> Void, failureHandler: @escaping (FailureType?, URLResponse?, Swift.Error?) -> Void) -> URLSessionDataTask {
        return dataTask(with: url, completionHandler: dataTaskCompletionHandler(decoder: decoder, successHandler: successHandler, failureHandler: failureHandler))
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

            errorHandler(MarvelKit.Error(message: "Unknown", code: "-1"))
        })
    }

    func resourceTask<Resource>(with request: Request<Resource>, success successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void, error errorHandler: @escaping (Swift.Error) -> Void) -> URLSessionTask {
        if let url = request.url {
            return resourceTask(with: url, errorHandler: errorHandler) { (dataWrapper: DataWrapper<DataContainer<Resource>>) in

                if let code = dataWrapper.code, code >= 300 {
                    errorHandler(MarvelKit.Error(message: dataWrapper.status ?? "Unknown", code: String(code)))
                    return
                }

                successHandler(dataWrapper)
            }
        } else {
            return dataTask(with: URL(fileURLWithPath: "")) { _, _, _ in
                errorHandler(MarvelKit.Error(message: "Failed to create URL for resource", code: "-1"))
            }
        }
    }

    // Same as above, but with flipped success and failure handlers, because it allows for nicer error chaining.
    func resourceTask<Resource>(with request: Request<Resource>, error errorHandler: @escaping (Swift.Error) -> Void, success successHandler: @escaping (DataWrapper<DataContainer<Resource>>) -> Void) -> URLSessionTask {
        return resourceTask(with: request, success: successHandler, error: errorHandler)
    }
    
}
