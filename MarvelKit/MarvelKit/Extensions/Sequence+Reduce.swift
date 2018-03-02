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

    var urlQueryItems: [URLQueryItem] {
        return reduce([], { aggregate, resourceParameter in
            return aggregate.appending(resourceParameter.urlQueryItem)
        })
    }
    
}
