//
//  StoryDataWrapper.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct StoryDataWrapper {

    /**
     * The HTTP status code of the returned result.
     */
    public let code: Int?

    /**
     * A string description of the call status.
     */
    public let status: String?

    /**
     * The copyright notice for the returned result.
     */
    public let copyright: String?

    /**
     * The attribution notice for this result.
     * Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.
     */
    public let attributionText: String?

    /**
     * An HTML representation of the attribution notice for this result.
     * Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.
     */
    public let attributionHTML: String?

    /**
     * The results returned by the call.
     */
    public let data: StoryDataContainer?

    /**
     * A digest value of the content returned by the call.
     */
    public let etag: String?

}
