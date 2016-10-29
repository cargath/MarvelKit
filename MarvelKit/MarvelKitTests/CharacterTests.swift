//
//  CharacterTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class CharacterTests: XCTestCase {

    var dataWrapper: CharacterDataWrapper?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataWrapper = CharacterDataWrapper(JSONObject: JSONSerialization.JSONObject(named: "CharacterTests", forBundle: Bundle(for: CharacterTests.self)))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCharacterDataWrapper() {

        XCTAssertNotNil(dataWrapper)

        XCTAssertEqual(dataWrapper?.code, 200)
        XCTAssertEqual(dataWrapper?.status, "Ok")
        XCTAssertEqual(dataWrapper?.copyright, "© 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionText, "Data provided by Marvel. © 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionHTML, "<a href=\"http://marvel.com\">Data provided by Marvel. © 2016 MARVEL</a>")
        XCTAssertEqual(dataWrapper?.etag, "a4f30ded56374e52b9a2c91528df8428cf0b2b05")
    }

    func testCharacterDataContainer() {

        XCTAssertNotNil(dataWrapper?.data)

        XCTAssertEqual(dataWrapper?.data?.offset, 0)
        XCTAssertEqual(dataWrapper?.data?.limit, 1)
        XCTAssertEqual(dataWrapper?.data?.total, 1485)
        XCTAssertEqual(dataWrapper?.data?.count, 1)
    }

    func testCharacterData() {

        XCTAssertEqual(dataWrapper?.data?.results.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].id, 1011334)
        XCTAssertEqual(dataWrapper?.data?.results[0].name, "3-D Man")
        XCTAssertEqual(dataWrapper?.data?.results[0].description, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].modified, "2014-04-29T14:18:17-0400")
        XCTAssertEqual(dataWrapper?.data?.results[0].resourceURI, "http://gateway.marvel.com/v1/public/characters/1011334")
    }

    func testThumbnail() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].thumbnail)

        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.pathExtension, "jpg")
    }

    func testComics() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].comics)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.available, 11)
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/comics")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.returned, 2)
    }

    func testComicItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/comics/21366")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].name, "Avengers: The Initiative (2007) #14")

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/comics/24571")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[1].name, "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)")
    }

    func testSeries() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].series)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.available, 2)
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/series")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.returned, 2)
    }

    func testSeriesItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/series/1945")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[0].name, "Avengers: The Initiative (2007 - 2010)")

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/series/2045")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.items[1].name, "Marvel Premiere (1972 - 1981)")
    }

    func testStories() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].stories)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.available, 17)
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/stories")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.returned, 2)
    }

    func testStoryItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/stories/19947")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].name, "Cover #19947")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].type, "cover")

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/stories/19948")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].name, "The 3-D Man!")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].type, "interiorStory")
    }

    func testEvents() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].events)

        XCTAssertEqual(dataWrapper?.data?.results[0].events?.available, 1)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/events")
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.returned, 1)
    }

    func testEventItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].events?.items.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].events?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/events/269")
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.items[0].name, "Secret Invasion")
    }

    func testUrls() {

        XCTAssertEqual(dataWrapper?.data?.results[0].urls.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].type, "detail")
        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].url, "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=21ad88fd0a067156ca0f6a77923ee6eb")

        XCTAssertEqual(dataWrapper?.data?.results[0].urls[1].type, "wiki")
        XCTAssertEqual(dataWrapper?.data?.results[0].urls[1].url, "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=21ad88fd0a067156ca0f6a77923ee6eb")
    }

}
