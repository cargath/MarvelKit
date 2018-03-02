//
//  URLSession+Codable.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 02.03.2018.
//  Copyright © 2018 cargath. All rights reserved.
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
