//
//  Image.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 28.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Image

public struct Image {

    /**
     * The directory path of to the image.
     */
    public let path: String?

    /**
     * The file extension for the image.
     * Actually 'extension', which is a keyword in Swift.
     */
    public let pathExtension: String?

}

// MARK: - Image + JSONObjectConvertible

extension Image: JSONObjectConvertible {

    public init?(JSONObject: JSONObject) {
        self.path = JSONObject["path"] as? String
        self.pathExtension = JSONObject["extension"] as? String
    }

}
