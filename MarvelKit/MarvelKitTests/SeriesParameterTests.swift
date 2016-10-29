//
//  SeriesParameterTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class SeriesParameterTests: XCTestCase {

    func testTitle() {
        XCTAssertEqual(SeriesParameter.title("Title").key, "title")
        XCTAssertEqual(SeriesParameter.title("Title").value, "Title")
    }

    func testTitleStartsWith() {
        XCTAssertEqual(SeriesParameter.titleStartsWith("TitleStartsWith").key, "titleStartsWith")
        XCTAssertEqual(SeriesParameter.titleStartsWith("TitleStartsWith").value, "TitleStartsWith")
    }

    func testStartYear() {
        XCTAssertEqual(SeriesParameter.startYear(1970).key, "startYear")
        XCTAssertEqual(SeriesParameter.startYear(1970).value, "1970")
    }

    func testModifiedSince() {
        XCTAssertEqual(SeriesParameter.modifiedSince(Date(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(SeriesParameter.modifiedSince(Date(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testComics() {
        XCTAssertEqual(SeriesParameter.comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(SeriesParameter.comics([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(SeriesParameter.stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(SeriesParameter.stories([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(SeriesParameter.events([1, 2, 3]).key, "events")
        XCTAssertEqual(SeriesParameter.events([1, 2, 3]).value, "1,2,3")
    }

    func testCreators() {
        XCTAssertEqual(SeriesParameter.creators([1, 2, 3]).key, "creators")
        XCTAssertEqual(SeriesParameter.creators([1, 2, 3]).value, "1,2,3")
    }

    func testCharacters() {
        XCTAssertEqual(SeriesParameter.characters([1, 2, 3]).key, "characters")
        XCTAssertEqual(SeriesParameter.characters([1, 2, 3]).value, "1,2,3")
    }

    func testSeriesType() {
        // Collection
        XCTAssertEqual(SeriesParameter.seriesType(.Collection).key, "seriesType")
        XCTAssertEqual(SeriesParameter.seriesType(.Collection).value, "collection")
        // One shot
        XCTAssertEqual(SeriesParameter.seriesType(.OneShot).key, "seriesType")
        XCTAssertEqual(SeriesParameter.seriesType(.OneShot).value, "one shot")
        // Limited
        XCTAssertEqual(SeriesParameter.seriesType(.Limited).key, "seriesType")
        XCTAssertEqual(SeriesParameter.seriesType(.Limited).value, "limited")
        // Ongoing
        XCTAssertEqual(SeriesParameter.seriesType(.Ongoing).key, "seriesType")
        XCTAssertEqual(SeriesParameter.seriesType(.Ongoing).value, "ongoing")
    }

    func testContains() {
        XCTAssertEqual(SeriesParameter.contains([.Comic, .Magazine, .TradePaperback, .Hardcover, .Digest, .GraphicNovel, .DigitalComic, .InfiniteComic]).key, "contains")
        XCTAssertEqual(SeriesParameter.contains([.Comic, .Magazine, .TradePaperback, .Hardcover, .Digest, .GraphicNovel, .DigitalComic, .InfiniteComic]).value, "comic,magazine,trade paperback,hardcover,digest,graphic novel,digital comic,infinite comic")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(SeriesParameter.orderBy([.TitleAscending, .ModifiedAscending, .StartYearAscending]).key, "orderBy")
        XCTAssertEqual(SeriesParameter.orderBy([.TitleAscending, .ModifiedAscending, .StartYearAscending]).value, "title,modified,startYear")
        // Descending
        XCTAssertEqual(SeriesParameter.orderBy([.TitleDescending, .ModifiedDescending, .StartYearDescending]).key, "orderBy")
        XCTAssertEqual(SeriesParameter.orderBy([.TitleDescending, .ModifiedDescending, .StartYearDescending]).value, "-title,-modified,-startYear")
    }

    func testLimit() {
        XCTAssertEqual(SeriesParameter.limit(1).key, "limit")
        XCTAssertEqual(SeriesParameter.limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(SeriesParameter.offset(1).key, "offset")
        XCTAssertEqual(SeriesParameter.offset(1).value, "1")
    }

}
