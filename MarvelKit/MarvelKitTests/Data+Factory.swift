//
//  Data+Factory.swift
//  MarvelKitTests
//
//  Created by Carsten Könemann on 28.06.2017.
//  Copyright © 2017 cargath. All rights reserved.
//

import Foundation
import MarvelKit

extension DataProtocol {
    
    static func resource(named name: String, bundle: Bundle) -> DataWrapper<DataContainer<Self>>? {
        
        if let filePath = bundle.path(forResource: name, ofType: "json") {
            
            do {
                return try JSONDecoder().decode(DataWrapper<DataContainer<Self>>.self, from: try Data(contentsOf: URL(fileURLWithPath: filePath)))
            } catch {
                print(error)
                return nil
            }
        }
        
        return nil
    }
    
}
