//
//  DataWrapper.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Data wrapper interface

public protocol DataWrapperProtocol {

    associatedtype ContainerProtocolType: DataContainerProtocol

}

// MARK: - Data wrapper implementation

public struct DataWrapper<ContainerType: DataContainerProtocol>: DataWrapperProtocol {

    public typealias ContainerProtocolType = ContainerType

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
    public let data: ContainerType?

    /**
     * A digest value of the content returned by the call.
     */
    public let etag: String?
    
}

// MARK: - Data wrapper + JSONObjectConvertible

extension DataWrapper: JSONObjectConvertible {

    public init?(jsonObject: JSONObject) {
        self.code = jsonObject["code"] as? Int
        self.status = jsonObject["status"] as? String
        self.copyright = jsonObject["copyright"] as? String
        self.attributionText = jsonObject["attributionText"] as? String
        self.attributionHTML = jsonObject["attributionHTML"] as? String
        self.data = ContainerType(jsonObject: jsonObject["data"] as? JSONObject)
        self.etag = jsonObject["etag"] as? String
    }

}
