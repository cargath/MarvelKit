//
//  SequenceType+Reduce.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

extension SequenceType {

    var csv: String {
        return enumerate().reduce("", combine: { aggregate, indexElementTuple in
            indexElementTuple.0 > 0 ? "\(aggregate),\(indexElementTuple.1)" : "\(aggregate)\(indexElementTuple.1)"
        })
    }

}

extension SequenceType where Generator.Element: ResourceParameterProtocol {

    var urlParameters: URLParameters {
        return reduce(URLParameters(), combine: { aggregate, resourceParameter in
            var newAggregate = aggregate
            newAggregate[resourceParameter.key] = resourceParameter.value
            return newAggregate
        })
    }
    
}
