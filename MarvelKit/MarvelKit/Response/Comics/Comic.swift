//
//  Comic.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 09.02.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Data implementation

public struct Comic: DataProtocol {

    /**
     * The unique ID of the comic resource.
     */
    public let id: Int?

    /**
     * The ID of the digital comic representation of this comic.
     * Will be 0 if the comic is not available digitally.
     */
    public let digitalId: Int?

    /**
     * The canonical title of the comic.
     */
    public let title: String?

    /**
     * The number of the issue in the series (will generally be 0 for collection formats).
     */
    public let issueNumber: Double?

    /**
     * If the issue is a variant (e.g. an alternate cover, second printing, or director’s cut), a text description of the variant.
     */
    public let variantDescription: String?

    /**
     * The preferred description of the comic.
     */
    public let description: String?

    /**
     * The date the resource was most recently modified.
     */
    public let modified: String?

    /**
     * The ISBN for the comic (generally only populated for collection formats).
     */
    public let isbn: String?

    /**
     * The UPC barcode number for the comic (generally only populated for periodical formats).
     */
    public let upc: String?

    /**
     * The Diamond code for the comic.
     */
    public let diamondCode: String?

    /**
     * The EAN barcode for the comic.
     */
    public let ean: String?

    /**
     * The ISSN barcode for the comic.
     */
    public let issn: String?

    /**
     * The publication format of the comic e.g. comic, hardcover, trade paperback.
     */
    public let format: String?

    /**
     * The number of story pages in the comic.
     */
    public let pageCount: Int?

    /**
     * A set of descriptive text blurbs for the comic.
     */
    public let textObjects: [TextObject]

    /**
     * The canonical URL identifier for this resource.
     */
    public let resourceURI: String?

    /**
     * A set of public web site URLs for the resource.
     */
    public let urls: [Url]

    /**
     * A summary representation of the series to which this comic belongs.
     */
    public let series: SeriesSummary?

    /**
     * A list of variant issues for this comic (includes the "original" issue if the current issue is a variant).
     */
    public let variants: [ComicSummary]

    /**
     * A list of collections which include this comic (will generally be empty if the comic's format is a collection).
     */
    public let collections: [ComicSummary]

    /**
     * A list of issues collected in this comic (will generally be empty for periodical formats such as "comic" or "magazine").
     */
    public let collectedIssues: [ComicSummary]

    /**
     * A list of key dates for this comic.
     */
    public let dates: [ComicDate]

    /**
     * A list of prices for this comic.
     */
    public let prices: [ComicPrice]

    /**
     * The representative image for this comic.
     */
    public let thumbnail: Image?

    /**
     * A list of promotional images associated with this comic.
     */
    public let images: [Image]

    /**
     * A resource list containing the creators associated with this comic.
     */
    public let creators: CreatorList?

    /**
     * A resource list containing the characters which appear in this comic.
     */
    public let characters: CharacterList?

    /**
     * A resource list containing the stories which appear in this comic.
     */
    public let stories: StoryList?

    /**
     * A resource list containing the events in which this comic appears.
     */
    public let events: EventList?

}

// MARK: - Comic + JSONObjectConvertible

extension Comic {

    public init?(JSONObject: JSONObject) {
        self.id = JSONObject["id"] as? Int
        self.digitalId = JSONObject["digitalId"] as? Int
        self.title = JSONObject["title"] as? String
        self.issueNumber = JSONObject["issueNumber"] as? Double
        self.variantDescription = JSONObject["variantDescription"] as? String
        self.description = JSONObject["description"] as? String
        self.modified = JSONObject["modified"] as? String
        self.isbn = JSONObject["isbn"] as? String
        self.upc = JSONObject["upc"] as? String
        self.diamondCode = JSONObject["diamondCode"] as? String
        self.ean = JSONObject["ean"] as? String
        self.issn = JSONObject["issn"] as? String
        self.format = JSONObject["format"] as? String
        self.pageCount = JSONObject["pageCount"] as? Int
        self.textObjects = TextObject.from(JSONArray: JSONObject["textObjects"] as? JSONArray)
        self.resourceURI = JSONObject["resourceURI"] as? String
        self.urls = Url.from(JSONArray: JSONObject["urls"] as? JSONArray)
        self.series = SeriesSummary(JSONObject: JSONObject["series"] as? JSONObject)
        self.variants = ComicSummary.from(JSONArray: JSONObject["variants"] as? JSONArray)
        self.collections = ComicSummary.from(JSONArray: JSONObject["collections"] as? JSONArray)
        self.collectedIssues = ComicSummary.from(JSONArray: JSONObject["collectedIssues"] as? JSONArray)
        self.dates = ComicDate.from(JSONArray: JSONObject["dates"] as? JSONArray)
        self.prices = ComicPrice.from(JSONArray: JSONObject["prices"] as? JSONArray)
        self.thumbnail = Image(JSONObject: JSONObject["thumbnail"] as? JSONObject)
        self.images = Image.from(JSONArray: JSONObject["images"] as? JSONArray)
        self.creators = CreatorList(JSONObject: JSONObject["creators"] as? JSONObject)
        self.characters = CharacterList(JSONObject: JSONObject["characters"] as? JSONObject)
        self.stories = StoryList(JSONObject: JSONObject["stories"] as? JSONObject)
        self.events = EventList(JSONObject: JSONObject["events"] as? JSONObject)
    }

}

// MARK: - Typealiases used in the Marvel API docs

public typealias ComicDataContainer = DataContainer<Comic>

public typealias ComicDataWrapper = DataWrapper<ComicDataContainer>
