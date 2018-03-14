//
//  Array+MarvelKit.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 02.03.2018.
//  Copyright © 2018 cargath. All rights reserved.
//

import Foundation

extension Array {

    func appending(_ newElement: Element) -> Array<Element> {
        var newArray = self
        newArray.append(newElement)
        return newArray
    }

}
