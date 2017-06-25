//
//  ComicTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class ComicTests: XCTestCase {

    var dataWrapper: ComicDataWrapper?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataWrapper = ComicDataWrapper(JSONObject: JSONSerialization.JSONObject(named: "ComicTests", forBundle: Bundle(for: ComicTests.self)))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testComicDataWrapper() {

        XCTAssertNotNil(dataWrapper)

        XCTAssertEqual(dataWrapper?.code, 200)
        XCTAssertEqual(dataWrapper?.status, "Ok")
        XCTAssertEqual(dataWrapper?.copyright, "© 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionText, "Data provided by Marvel. © 2016 MARVEL")
        XCTAssertEqual(dataWrapper?.attributionHTML, "<a href=\"http://marvel.com\">Data provided by Marvel. © 2016 MARVEL</a>")
        XCTAssertEqual(dataWrapper?.etag, "20d317a16d0379e8bd6a535de05507b85a3cce5e")
    }

    func testComicDataContainer() {

        XCTAssertNotNil(dataWrapper?.data)

        XCTAssertEqual(dataWrapper?.data?.offset, 0)
        XCTAssertEqual(dataWrapper?.data?.limit, 1)
        XCTAssertEqual(dataWrapper?.data?.total, 36764)
        XCTAssertEqual(dataWrapper?.data?.count, 1)
    }

    func testComicData() {

        XCTAssertEqual(dataWrapper?.data?.results.count, 1)
        
        XCTAssertEqual(dataWrapper?.data?.results[0].id, 42882)
        XCTAssertEqual(dataWrapper?.data?.results[0].digitalId, 26110)
        XCTAssertEqual(dataWrapper?.data?.results[0].title, "Lorna the Jungle Girl (1954) #6")
        XCTAssertEqual(dataWrapper?.data?.results[0].issueNumber, 6)
        XCTAssertEqual(dataWrapper?.data?.results[0].variantDescription, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].description, nil)
        XCTAssertEqual(dataWrapper?.data?.results[0].modified, "2015-10-15T11:13:52-0400")
        XCTAssertEqual(dataWrapper?.data?.results[0].modifiedDate, Date.with(year: 2015, month: 10, day: 15, hour: 11, minute: 13, second: 52, timeZoneOffset: -4 * 60 * 60))
        XCTAssertEqual(dataWrapper?.data?.results[0].isbn, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].upc, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].diamondCode, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].ean, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].issn, "")
        XCTAssertEqual(dataWrapper?.data?.results[0].format, "Comic")
        XCTAssertEqual(dataWrapper?.data?.results[0].pageCount, 32)
        XCTAssertEqual(dataWrapper?.data?.results[0].textObjects.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].resourceURI, "http://gateway.marvel.com/v1/public/comics/42882")
        XCTAssertEqual(dataWrapper?.data?.results[0].variants.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].collections.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].collectedIssues.count, 0)
    }

    func testUrls() {

        XCTAssertEqual(dataWrapper?.data?.results[0].urls.count, 2)

        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].type, "detail")
        XCTAssertEqual(dataWrapper?.data?.results[0].urls[0].url, "http://marvel.com/comics/issue/42882/lorna_the_jungle_girl_1954_6?utm_campaign=apiRef&utm_source=21ad88fd0a067156ca0f6a77923ee6eb")

        XCTAssertEqual(dataWrapper?.data?.results[0].urls[1].type, "reader")
        XCTAssertEqual(dataWrapper?.data?.results[0].urls[1].url, "http://marvel.com/digitalcomics/view.htm?iid=26110&utm_campaign=apiRef&utm_source=21ad88fd0a067156ca0f6a77923ee6eb")
    }

    func testSeries() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].series)

        XCTAssertEqual(dataWrapper?.data?.results[0].series?.resourceURI, "http://gateway.marvel.com/v1/public/series/16355")
        XCTAssertEqual(dataWrapper?.data?.results[0].series?.name, "Lorna the Jungle Girl (1954 - 1957)")
    }

    func testDates() {

        XCTAssertEqual(dataWrapper?.data?.results[0].dates.count, 3)

        XCTAssertEqual(dataWrapper?.data?.results[0].dates[0].type, "onsaleDate")
        XCTAssertEqual(dataWrapper?.data?.results[0].dates[0].date, "2054-03-01T00:00:00-0500")
        XCTAssertEqual(dataWrapper?.data?.results[0].onsaleDate, Date.with(year: 2054, month: 3, day: 1, hour: 00, minute: 00, second: 00, timeZoneOffset: -5 * 60 * 60))

        XCTAssertEqual(dataWrapper?.data?.results[0].dates[1].type, "focDate")
        XCTAssertEqual(dataWrapper?.data?.results[0].dates[1].date, "1970-11-30T00:00:00-0500")
        XCTAssertEqual(dataWrapper?.data?.results[0].focDate, Date.with(year: 1970, month: 11, day: 30, hour: 00, minute: 00, second: 00, timeZoneOffset: -5 * 60 * 60))

        XCTAssertEqual(dataWrapper?.data?.results[0].dates[2].type, "unlimitedDate")
        XCTAssertEqual(dataWrapper?.data?.results[0].dates[2].date, "2012-04-13T00:00:00-0400")
        XCTAssertEqual(dataWrapper?.data?.results[0].unlimitedDate, Date.with(year: 2012, month: 4, day: 13, hour: 00, minute: 00, second: 00, timeZoneOffset: -4 * 60 * 60))
    }

    func testPrices() {

        XCTAssertEqual(dataWrapper?.data?.results[0].prices.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].prices[0].type, "printPrice")
        XCTAssertEqual(dataWrapper?.data?.results[0].prices[0].price, 0)
    }

    func testThumbnail() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].thumbnail)

        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.path, "http://i.annihil.us/u/prod/marvel/i/mg/9/40/50b4fc783d30f")
        XCTAssertEqual(dataWrapper?.data?.results[0].thumbnail?.pathExtension, "jpg")
    }

    func testImages() {

        XCTAssertEqual(dataWrapper?.data?.results[0].images.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].images[0].path, "http://i.annihil.us/u/prod/marvel/i/mg/9/40/50b4fc783d30f")
        XCTAssertEqual(dataWrapper?.data?.results[0].images[0].pathExtension, "jpg")
    }

    func testCreators() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].creators)

        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.collectionURI, "http://gateway.marvel.com/v1/public/comics/42882/creators")
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].creators?.returned, 0)
    }

    func testCharacters() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].characters)

        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.collectionURI, "http://gateway.marvel.com/v1/public/comics/42882/characters")
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].characters?.returned, 0)
    }

    func testStories() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].stories)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.available, 1)
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.collectionURI, "http://gateway.marvel.com/v1/public/comics/42882/stories")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.returned, 1)
    }

    func testStoryItems() {

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items.count, 1)

        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].resourceURI, "http://gateway.marvel.com/v1/public/stories/106292")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].name, "cover from Lorna the Jungle Girl #6")
        XCTAssertEqual(dataWrapper?.data?.results[0].stories?.items[0].type, "cover")
    }

    func testEvents() {

        XCTAssertNotNil(dataWrapper?.data?.results[0].events)

        XCTAssertEqual(dataWrapper?.data?.results[0].events?.available, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.collectionURI, "http://gateway.marvel.com/v1/public/comics/42882/events")
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.items.count, 0)
        XCTAssertEqual(dataWrapper?.data?.results[0].events?.returned, 0)
    }

}
