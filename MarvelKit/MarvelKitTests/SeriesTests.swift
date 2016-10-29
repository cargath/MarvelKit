//
//  SeriesTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class SeriesTests: XCTestCase {

    var dataWrapper: SeriesDataWrapper?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataWrapper = SeriesDataWrapper(jsonObject: JSONSerialization.JSONObjectNamed("SeriesTests", forBundle: Bundle(for: SeriesTests.self)))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSeriesDataWrapper() {

        XCTAssertNotNil(dataWrapper)

        XCTAssertEqual(dataWrapper?.code, 200)
        XCTAssertEqual(dataWrapper?.status, "Ok")
        XCTAssertEqual(dataWrapper?.copyright, "© 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionText, "Data provided by Marvel. © 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionHTML, "<a href=\"http://marvel.com\">Data provided by Marvel. © 2016 MARVEL</a>")
        XCTAssertEqual(dataWrapper?.etag, "d554a6a0f1fdfbc6d6818bb8986011e4fb929cdf")
    }

    func testSeriesDataContainer() {

        XCTAssertNotNil(dataWrapper?.data)

        XCTAssertEqual(dataWrapper?.data?.offset, 0)
        XCTAssertEqual(dataWrapper?.data?.limit, 1)
        XCTAssertEqual(dataWrapper?.data?.total, 8590)
        XCTAssertEqual(dataWrapper?.data?.count, 1)
    }

    func testSeriesData() {

        XCTAssertEqual(dataWrapper?.data?.results.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].id, 18454)
        XCTAssertEqual(dataWrapper?.data?.results[0].title, "100th Anniversary Special (2014 - Present)")
        XCTAssertEqual(dataWrapper?.data?.results[0].description, nil)
        XCTAssertEqual(dataWrapper?.data?.results[0].resourceURI, "http://gateway.marvel.com/v1/public/series/18454")
        XCTAssertEqual(dataWrapper?.data?.results[0].startYear, 2014)
        XCTAssertEqual(dataWrapper?.data?.results[0].endYear, 2099)
        XCTAssertEqual(dataWrapper?.data?.results[0].rating, "Rated T")
        XCTAssertEqual(dataWrapper?.data?.results[0].type, "limited")
        XCTAssertEqual(dataWrapper?.data?.results[0].modified, "2015-01-14T08:48:32-0500")

        XCTAssertNil(dataWrapper?.data?.results[0].next)
        XCTAssertNil(dataWrapper?.data?.results[0].previous)
    }

    func testUrls() {

        XCTAssertEqual(dataWrapper?.data?.results[0].urls.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].type, "detail")
        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].url, "http://marvel.com/comics/series/18454/100th_anniversary_special_2014_-_present?utm_campaign=apiRef&utm_source=21ad88fd0a067156ca0f6a77923ee6eb")
    }

    func testThumbnail() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].thumbnail)

        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.path, "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available")
        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.pathExtension, "jpg")
    }

    func testCreators() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].creators)

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.available, 2)
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.collectionURI, "http://gateway.marvel.com/v1/public/series/18454/creators")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.returned, 2)
    }

    func testCreatorItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/creators/485")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[0].name, "Andy Lanning")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[0].role, "writer")

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/creators/9432")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[1].name, "Sean Ryan")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items[1].role, "writer")
    }

    func testCharacters() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].characters)

        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.collectionURI, "http://gateway.marvel.com/v1/public/series/18454/characters")
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.returned, 0)
    }

    func testStories() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].stories)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.available, 2)
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.collectionURI, "http://gateway.marvel.com/v1/public/series/18454/stories")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.returned, 2)
    }

    func testStoryItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/stories/110101")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].name, "cover from 100th Anniversary Special (2014) #1")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].type, "cover")

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/stories/110102")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].name, "story from 100th Anniversary Special (2014) #1")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[1].type, "interiorStory")
    }

    func testComics() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].comics)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.available, 2)
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.collectionURI, "http://gateway.marvel.com/v1/public/series/18454/comics")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.returned, 2)
    }

    func testComicItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/comics/49011")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[0].name, "100th Anniversary Special (2014) #1")

        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[1].resourceURI, "http://gateway.marvel.com/v1/public/comics/49009")
        XCTAssertEqual(dataWrapper?.data?.results[0].comics?.items[1].name, "100th Anniversary Special (2014) #1")
    }

    func testEvents() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].events)

        XCTAssertEqual(dataWrapper?.data?.results[0].events?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.collectionURI, "http://gateway.marvel.com/v1/public/series/18454/events")
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.returned, 0)
    }

}
