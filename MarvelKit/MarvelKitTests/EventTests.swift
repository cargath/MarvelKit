//
//  EventTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class EventTests: XCTestCase {

    var dataWrapper: EventDataWrapper?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataWrapper = EventDataWrapper(JSONObject: JSONSerialization.JSONObject(named: "EventTests", forBundle: Bundle(for: EventTests.self)))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEventDataWrapper() {

        XCTAssertNotNil(dataWrapper)

        XCTAssertEqual(dataWrapper?.code, 200)
        XCTAssertEqual(dataWrapper?.status, "Ok")
        XCTAssertEqual(dataWrapper?.copyright, "© 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionText, "Data provided by Marvel. © 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionHTML, "<a href=\"http://marvel.com\">Data provided by Marvel. © 2016 MARVEL</a>")
        XCTAssertEqual(dataWrapper?.etag, "6d33346319bf903bb74adc6ee76393b996d605be")
    }

    func testEventDataContainer() {

        XCTAssertNotNil(dataWrapper?.data)

        XCTAssertEqual(dataWrapper?.data?.offset, 0)
        XCTAssertEqual(dataWrapper?.data?.limit, 1)
        XCTAssertEqual(dataWrapper?.data?.total, 69)
        XCTAssertEqual(dataWrapper?.data?.count, 1)
    }

    func testEventData() {

        XCTAssertEqual(dataWrapper?.data?.results.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].id, 116)
        XCTAssertEqual(dataWrapper?.data?.results[0].title, "Acts of Vengeance!")
        XCTAssertEqual(dataWrapper?.data?.results[0].description, "Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.")
        XCTAssertEqual(dataWrapper?.data?.results[0].resourceURI, "http://gateway.marvel.com/v1/public/events/116")
        XCTAssertEqual(dataWrapper?.data?.results[0].modified, "2013-06-28T16:31:24-0400")
        XCTAssertEqual(dataWrapper?.data?.results[0].start, "1989-12-10 00:00:00")
        XCTAssertEqual(dataWrapper?.data?.results[0].end, "2008-01-04 00:00:00")
    }

    func testUrls() {

        XCTAssertEqual(dataWrapper?.data?.results[0].urls.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].type, "detail")
        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].url, "http://marvel.com/comics/events/116/acts_of_vengeance?utm_campaign=apiRef&utm_source=21ad88fd0a067156ca0f6a77923ee6eb")

        XCTAssertEqual(dataWrapper?.data?.results[0].urls[1].type, "wiki")
        XCTAssertEqual(dataWrapper?.data?.results[0].urls[1].url, "http://marvel.com/universe/Acts_of_Vengeance!?utm_campaign=apiRef&utm_source=21ad88fd0a067156ca0f6a77923ee6eb")
    }

    func testThumbnail() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].thumbnail)

        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.path, "http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b")
        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.pathExtension, "jpg")
    }

    func testCreators() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].creators)

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.available, 115)
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.collectionURI, "http://gateway.marvel.com/v1/public/events/116/creators")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.returned, 2)
    }

    func testCreatorItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/creators/2707")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[0].name, "Jeff Albrecht")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[0].role, "inker")

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/creators/2077")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[1].name, "Hilary Barta")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[1].role, "inker")
    }

    func testCharacters() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].characters)

        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.available, 67)
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.collectionURI, "http://gateway.marvel.com/v1/public/events/116/characters")
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.returned, 2)
    }

    func testCharacterItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/characters/1010370")
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.items[0].name, "Alpha Flight")

        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/characters/1009152")
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.items[1].name, "Ancient One")
    }

    func testStories() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].stories)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.available, 145)
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.collectionURI, "http://gateway.marvel.com/v1/public/events/116/stories")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.returned, 2)
    }

    func testStoryItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/stories/12960")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].name, "Cover #12960")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].type, "cover")

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/stories/12961")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].name, "Shadows of Alarm..!")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].type, "interiorStory")
    }

    func testComics() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].comics)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.available, 52)
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.collectionURI, "http://gateway.marvel.com/v1/public/events/116/comics")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.returned, 2)
    }

    func testComicItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/comics/12744")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].name, "Alpha Flight (1983) #79")

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/comics/12746")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[1].name, "Alpha Flight (1983) #80")
    }

    func testSeries() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].series)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.available, 22)
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.collectionURI, "http://gateway.marvel.com/v1/public/events/116/series")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.returned, 2)
    }

    func testSeriesItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/series/2116")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[0].name, "Alpha Flight (1983 - 1994)")

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/series/1987")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[1].name, "Amazing Spider-Man (1963 - 1998)")
    }

    func testNext() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].next)

        XCTAssertEqual(dataWrapper?.data?.results[0].next?.resourceURI, "http://gateway.marvel.com/v1/public/events/240")
        XCTAssertEqual(dataWrapper?.data?.results[0].next?.name, "Days of Future Present")
    }

    func testPrevious() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].previous)

        XCTAssertEqual(dataWrapper?.data?.results[0].previous?.resourceURI, "http://gateway.marvel.com/v1/public/events/233")
        XCTAssertEqual(dataWrapper?.data?.results[0].previous?.name, "Atlantis Attacks")
    }

}
