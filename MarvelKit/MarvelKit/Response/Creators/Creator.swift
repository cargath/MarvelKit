//
//  Creator.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Data implementation

public struct Creator: DataProtocol {

    /**
     * The unique ID of the creator resource.
     */
    public let id: Int?

    /**
     * The first name of the creator.
     */
    public let firstName: String?

    /**
     * The middle name of the creator.
     */
    public let middleName: String?

    /**
     * The last name of the creator.
     */
    public let lastName: String?

    /**
     * The suffix or honorific for the creator.
     */
    public let suffix: String?

    /**
     * The full name of the creator (a space-separated concatenation of the above four fields).
     */
    public let fullName: String?

    /**
     * The date the resource was most recently modified.
     */
    public let modified: String?

    /**
     * The canonical URL identifier for this resource.
     */
    public let resourceURI: String?

    /**
     * A set of public web site URLs for the resource.
     */
    public let urls: [Url]

    /**
     * The representative image for this creator.
     */
    public let thumbnail: Image?

    /**
     * A resource list containing the series which feature work by this creator.
     */
    public let series: SeriesList?

    /**
     * A resource list containing the stories which feature work by this creator.
     */
    public let stories: StoryList?

    /**
     * A resource list containing the comics which feature work by this creator.
     */
    public let comics: ComicList?

    /**
     * A resource list containing the events which feature work by this creator.
     */
    public let events: EventList?

}

// MARK: - Creator + JSONObjectConvertible

extension Creator {

    public init?(JSONObject: JSONObject) {
        self.id = JSONObject["id"] as? Int
        self.firstName = JSONObject["firstName"] as? String
        self.middleName = JSONObject["middleName"] as? String
        self.lastName = JSONObject["lastName"] as? String
        self.suffix = JSONObject["suffix"] as? String
        self.fullName = JSONObject["fullName"] as? String
        self.modified = JSONObject["modified"] as? String
        self.resourceURI = JSONObject["resourceURI"] as? String
        self.urls = Url.from(JSONArray: JSONObject["urls"] as? JSONArray)
        self.thumbnail = Image(JSONObject: JSONObject["thumbnail"] as? JSONObject)
        self.series = SeriesList(JSONObject: JSONObject["series"] as? JSONObject)
        self.stories = StoryList(JSONObject: JSONObject["stories"] as? JSONObject)
        self.comics = ComicList(JSONObject: JSONObject["comics"] as? JSONObject)
        self.events = EventList(JSONObject: JSONObject["events"] as? JSONObject)
    }

}

// MARK: - Typealiases used in the Marvel API docs

public typealias CreatorDataContainer = DataContainer<Creator>

public typealias CreatorDataWrapper = DataWrapper<CreatorDataContainer>
