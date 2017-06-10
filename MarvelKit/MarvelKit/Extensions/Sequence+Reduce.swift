//
//  Sequence+Reduce.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension Sequence {

    var csv: String {
        return map({"\($0)"}).joined(separator: ",")
    }

}

extension Sequence where Iterator.Element: ResourceParameterProtocol {

    // TODO: add custom init(resourceParameter: [ResourceParameterProtocol]) to URLParameters
    var urlParameters: URLParameters {
        return reduce(URLParameters(), { aggregate, resourceParameter in
            var newAggregate = aggregate
            newAggregate[resourceParameter.key] = resourceParameter.value
            return newAggregate
        })
    }
    
}
