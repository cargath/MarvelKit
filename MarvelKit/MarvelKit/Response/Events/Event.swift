//
//  Event.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Data implementation

public struct Event: DataProtocol {

    /**
     * The unique ID of the event resource.
     */
    public let id: Int?

    /**
     * The title of the event.
     */
    public let title: String?

    /**
     * A description of the event.
     */
    public let description: String?

    /**
     * The canonical URL identifier for this resource.
     */
    public let resourceURI: String?

    /**
     * A set of public web site URLs for the event.
     */
    public let urls: [Url]

    /**
     * The date the resource was most recently modified.
     */
    public let modified: String?

    /**
     * The date of publication of the first issue in this event.
     */
    public let start: String?

    /**
     * The date of publication of the last issue in this event.
     */
    public let end: String?

    /**
     * The representative image for this event.
     */
    public let thumbnail: Image?

    /**
     * A resource list containing the comics in this event.
     */
    public let comics: ComicList?

    /**
     * A resource list containing the stories in this event.
     */
    public let stories: StoryList?

    /**
     * A resource list containing the series in this event.
     */
    public let series: SeriesList?

    /**
     * A resource list containing the characters which appear in this event.
     */
    public let characters: CharacterList?

    /**
     * A resource list containing creators whose work appears in this event.
     */
    public let creators: CreatorList?

    /**
     * A summary representation of the event which follows this event.
     */
    public let next: EventSummary?

    /**
     * A summary representation of the event which preceded this event.
     */
    public let previous: EventSummary?

}

// MARK: - Event + dates

public extension Event {
    
    public var startDate: Date? {
        return start?.eventDate
    }
    
    public var endDate: Date? {
        return end?.eventDate
    }
    
}

// MARK: - Event + JSONObjectConvertible

extension Event {

    public init?(JSONObject: JSONObject) {
        self.id = JSONObject["id"] as? Int
        self.title = JSONObject["title"] as? String
        self.description = JSONObject["description"] as? String
        self.resourceURI = JSONObject["resourceURI"] as? String
        self.urls = Url.from(JSONArray: JSONObject["urls"] as? JSONArray)
        self.modified = JSONObject["modified"] as? String
        self.start = JSONObject["start"] as? String
        self.end = JSONObject["end"] as? String
        self.thumbnail = Image(JSONObject: JSONObject["thumbnail"] as? JSONObject)
        self.comics = ComicList(JSONObject: JSONObject["comics"] as? JSONObject)
        self.stories = StoryList(JSONObject: JSONObject["stories"] as? JSONObject)
        self.series = SeriesList(JSONObject: JSONObject["series"] as? JSONObject)
        self.characters = CharacterList(JSONObject: JSONObject["characters"] as? JSONObject)
        self.creators = CreatorList(JSONObject: JSONObject["creators"] as? JSONObject)
        self.next = EventSummary(JSONObject: JSONObject["next"] as? JSONObject)
        self.previous = EventSummary(JSONObject: JSONObject["previous"] as? JSONObject)
    }

}

// MARK: - Typealiases used in the Marvel API docs

public typealias EventDataContainer = DataContainer<Event>

public typealias EventDataWrapper = DataWrapper<EventDataContainer>
