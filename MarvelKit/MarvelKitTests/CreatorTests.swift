//
//  CreatorTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class CreatorTests: XCTestCase {

    var dataWrapper: CreatorDataWrapper?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataWrapper = CreatorDataWrapper(jsonObject: NSJSONSerialization.JSONObjectNamed("CreatorTests", forBundle: NSBundle(forClass: CreatorTests.self)))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreatorDataWrapper() {

        XCTAssertNotNil(dataWrapper)

        XCTAssertEqual(dataWrapper?.code, 200)
        XCTAssertEqual(dataWrapper?.status, "Ok")
        XCTAssertEqual(dataWrapper?.copyright, "© 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionText, "Data provided by Marvel. © 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionHTML, "<a href=\"http://marvel.com\">Data provided by Marvel. © 2016 MARVEL</a>")
        XCTAssertEqual(dataWrapper?.etag, "5eda221100a14be40ae62fdb63bd9dd5aef7a0c8")
    }

    func testCreatorDataContainer() {

        XCTAssertNotNil(dataWrapper?.data)

        XCTAssertEqual(dataWrapper?.data?.offset, 42)
        XCTAssertEqual(dataWrapper?.data?.limit, 1)
        XCTAssertEqual(dataWrapper?.data?.total, 5998)
        XCTAssertEqual(dataWrapper?.data?.count, 1)
    }

    func testCreatorData() {

        XCTAssertEqual(dataWrapper?.data?.results.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].id, 6642)
        XCTAssertEqual(dataWrapper?.data?.results[0].firstName, "Cameron")
        XCTAssertEqual(dataWrapper?.data?.results[0].middleName, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].lastName, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].suffix, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].fullName, "Cameron")
        XCTAssertEqual(dataWrapper?.data?.results[0].modified, "2007-01-02T00:00:00-0500")
        XCTAssertEqual(dataWrapper?.data?.results[0].resourceURI, "http://gateway.marvel.com/v1/public/creators/6642")
    }

    func testThumbnail() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].thumbnail)

        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.path, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available")
        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.pathExtension, "jpg")
    }

    func testComics() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].comics)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.available, 1)
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.collectionURI, "http://gateway.marvel.com/v1/public/creators/6642/comics")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.returned, 1)
    }

    func testComicItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/comics/19833")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].name, "Marvel Fanfare (1982) #56")
    }

    func testSeries() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].series)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.available, 1)
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.collectionURI, "http://gateway.marvel.com/v1/public/creators/6642/series")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.returned, 1)
    }

    func testSeriesItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/series/3719")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[0].name, "Marvel Fanfare (1982 - 1992)")
    }

    func testStories() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].stories)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.available, 4)
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.collectionURI, "http://gateway.marvel.com/v1/public/creators/6642/stories")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.returned, 2)
    }

    func testStoryItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/stories/42458")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].name, "pinup")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].type, "")

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/stories/42459")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].name, "pinup")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].type, "")
    }

    func testEvents() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].events)

        XCTAssertEqual(dataWrapper?.data?.results[0].events?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.collectionURI, "http://gateway.marvel.com/v1/public/creators/6642/events")
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.returned, 0)
    }

    func testUrls() {

        XCTAssertEqual(dataWrapper?.data?.results[0].urls.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].type, "detail")
        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].url, "http://marvel.com/comics/creators/6642/cameron?utm_campaign=apiRef&utm_source=21ad88fd0a067156ca0f6a77923ee6eb")
    }

}
