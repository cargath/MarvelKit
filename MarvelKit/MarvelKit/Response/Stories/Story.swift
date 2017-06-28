//
//  Story.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - Data implementation

public struct Story: DataProtocol {

    /// The unique ID of the story resource.
    public let id: Int?

    /// The story title.
    public let title: String?

    /// A short description of the story.
    public let description: String?

    /// The canonical URL identifier for this resource.
    public let resourceURI: String?

    /// The story type e.g. interior story, cover, text story.
    public let type: String?

    /// The date the resource was most recently modified.
    public let modified: String?

    /// The representative image for this story.
    public let thumbnail: Image?

    /// A resource list containing comics in which this story takes place.
    public let comics: ComicList?

    /// A resource list containing series in which this story appears.
    public let series: SeriesList?

    /// A resource list of the events in which this story appears.
    public let events: EventList?

    /// A resource list of characters which appear in this story.
    public let characters: CharacterList?

    /// A resource list of creators who worked on this story.
    public let creators: CreatorList?

    /// A summary representation of the issue in which this story was originally published.
    public let originalIssue: ComicSummary?

}

// MARK: - Typealiases used in the Marvel API docs

public typealias StoryDataContainer = DataContainer<Story>

public typealias StoryDataWrapper = DataWrapper<StoryDataContainer>
