//
//  StoryTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class StoryTests: XCTestCase {

    var dataWrapper: StoryDataWrapper?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataWrapper = StoryDataWrapper(JSONObject: JSONSerialization.JSONObject(named: "StoryTests", forBundle: Bundle(for: StoryTests.self)))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStoryDataWrapper() {

        XCTAssertNotNil(dataWrapper)

        XCTAssertEqual(dataWrapper?.code, 200)
        XCTAssertEqual(dataWrapper?.status, "Ok")
        XCTAssertEqual(dataWrapper?.copyright, "© 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionText, "Data provided by Marvel. © 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionHTML, "<a href=\"http://marvel.com\">Data provided by Marvel. © 2016 MARVEL</a>")
        XCTAssertEqual(dataWrapper?.etag, "0902b19f7c0c87c5378c3e6164969a014733dee1")
    }

    func testStoryDataContainer() {

        XCTAssertNotNil(dataWrapper?.data)

        XCTAssertEqual(dataWrapper?.data?.offset, 0)
        XCTAssertEqual(dataWrapper?.data?.limit, 1)
        XCTAssertEqual(dataWrapper?.data?.total, 82463)
        XCTAssertEqual(dataWrapper?.data?.count, 1)
    }

    func testStoryData() {

        XCTAssertEqual(dataWrapper?.data?.results.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].id, 7)
        XCTAssertEqual(dataWrapper?.data?.results[0].title, "Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf")
        XCTAssertEqual(dataWrapper?.data?.results[0].description, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].resourceURI, "http://gateway.marvel.com/v1/public/stories/7")
        XCTAssertEqual(dataWrapper?.data?.results[0].type, "story")
        XCTAssertEqual(dataWrapper?.data?.results[0].modified, "1969-12-31T19:00:00-0500")
        XCTAssertEqual(dataWrapper?.data?.results[0].modifiedDate, Date.with(year: 1969, month: 12, day: 31, hour: 19, minute: 0, second: 0, timeZoneOffset: -5 * 60 * 60))

        XCTAssertNil(dataWrapper?.data?.results[0].thumbnail)
    }

    func testCreators() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].creators)

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.collectionURI, "http://gateway.marvel.com/v1/public/stories/7/creators")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.returned, 0)
    }

    func testCharacters() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].characters)

        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.collectionURI, "http://gateway.marvel.com/v1/public/stories/7/characters")
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.returned, 0)
    }

    func testSeries() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].series)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.available, 1)
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.collectionURI, "http://gateway.marvel.com/v1/public/stories/7/series")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.returned, 1)
    }

    func testSeriesItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/series/6")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[0].name, "Cage Vol. I (2002)")
    }

    func testComics() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].comics)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.available, 1)
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.collectionURI, "http://gateway.marvel.com/v1/public/stories/7/comics")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.returned, 1)
    }

    func testComicItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/comics/941")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].name, "Cage Vol. I (Hardcover)")
    }

    func testEvents() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].events)

        XCTAssertEqual(dataWrapper?.data?.results[0].events?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.collectionURI, "http://gateway.marvel.com/v1/public/stories/7/events")
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.returned, 0)
    }

    func testOriginalIssue() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].originalIssue)

        XCTAssertEqual(dataWrapper?.data?.results[0].originalIssue?.resourceURI, "http://gateway.marvel.com/v1/public/comics/941")
        XCTAssertEqual(dataWrapper?.data?.results[0].originalIssue?.name, "Cage Vol. I (Hardcover)")
    }

}
