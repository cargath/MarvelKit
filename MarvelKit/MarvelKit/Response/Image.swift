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
     */
    public let pathExtension: String?

}

// MARK: - Image + JSONObjectConvertible

extension Image: JSONObjectConvertible {

    public init?(jsonObject: JSONObject) {
        self.path = jsonObject["path"] as? String
        self.pathExtension = jsonObject["pathExtension"] as? String
    }

}
