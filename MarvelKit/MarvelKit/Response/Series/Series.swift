//
//  Series.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Data implementation

public struct Series: DataProtocol {

    /// The unique ID of the series resource.
    public let id: Int?

    /// The canonical title of the series.
    public let title: String?

    /// A description of the series.
    public let description: String?

    /// The canonical URL identifier for this resource.
    public let resourceURI: String?

    /// A set of public web site URLs for the resource.
    public let urls: [Url]?

    /// The first year of publication for the series.
    public let startYear: Int?

    /// The last year of publication for the series (conventionally, 2099 for ongoing series).
    public let endYear: Int?

    /// The age-appropriateness rating for the series.
    public let rating: String?

    /// Note: Appears in response body, not model schema.
    public let type: String?

    /// The date the resource was most recently modified.
    public let modified: String?

    /// The representative image for this series.
    public let thumbnail: Image?

    /// A resource list containing comics in this series.
    public let comics: ComicList?

    /// A resource list containing stories which occur in comics in this series.
    public let stories: StoryList?

    /// A resource list containing events which take place in comics in this series.
    public let events: EventList?

    /// A resource list containing characters which appear in comics in this series.
    public let characters: CharacterList?

    /// A resource list of creators whose work appears in comics in this series.
    public let creators: CreatorList?

    /// A summary representation of the series which follows this series.
    public let next: SeriesSummary?

    /// A summary representation of the series which preceded this series.
    public let previous: SeriesSummary?

}

// MARK: - Typealiases used in the Marvel API docs

public typealias SeriesDataContainer = DataContainer<Series>

public typealias SeriesDataWrapper = DataWrapper<SeriesDataContainer>
