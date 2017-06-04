//
//  Sequence+Reduce.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension Sequence {

    var csv: String {
        return enumerated().reduce("", { aggregate, indexElementTuple in
            indexElementTuple.0 > 0 ? "\(aggregate),\(indexElementTuple.1)" : "\(aggregate)\(indexElementTuple.1)"
        })
    }

}

extension Sequence where Iterator.Element: ResourceParameterProtocol {

    var urlParameters: URLParameters {
        return reduce(URLParameters(), { aggregate, resourceParameter in
            var newAggregate = aggregate
            newAggregate[resourceParameter.key] = resourceParameter.value
            return newAggregate
        })
    }
    
}
