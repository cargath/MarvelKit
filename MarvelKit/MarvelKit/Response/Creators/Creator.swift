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

    public init?(jsonObject: JSONObject) {
        self.id = jsonObject["id"] as? Int
        self.firstName = jsonObject["firstName"] as? String
        self.middleName = jsonObject["middleName"] as? String
        self.lastName = jsonObject["lastName"] as? String
        self.suffix = jsonObject["suffix"] as? String
        self.fullName = jsonObject["fullName"] as? String
        self.modified = jsonObject["modified"] as? String
        self.resourceURI = jsonObject["resourceURI"] as? String
        self.urls = Url.fromJSONArray(jsonObject["urls"] as? JSONArray)
        self.thumbnail = Image(jsonObject: jsonObject["thumbnail"] as? JSONObject)
        self.series = SeriesList(jsonObject: jsonObject["series"] as? JSONObject)
        self.stories = StoryList(jsonObject: jsonObject["stories"] as? JSONObject)
        self.comics = ComicList(jsonObject: jsonObject["comics"] as? JSONObject)
        self.events = EventList(jsonObject: jsonObject["events"] as? JSONObject)
    }

}

// MARK: - Typealiases used in the Marvel API docs

public typealias CreatorDataContainer = DataContainer<Creator>

public typealias CreatorDataWrapper = DataWrapper<CreatorDataContainer>
