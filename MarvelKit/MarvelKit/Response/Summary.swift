//
//  Summary.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Summary interface

public protocol SummaryProtocol: Codable {

    var resourceURI: String? { get }

    var name: String? { get }

}
