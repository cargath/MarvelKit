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
        XCTAssertEqual(SeriesParameter.Title("Title").key, "title")
        XCTAssertEqual(SeriesParameter.Title("Title").value, "Title")
    }

    func testTitleStartsWith() {
        XCTAssertEqual(SeriesParameter.TitleStartsWith("TitleStartsWith").key, "titleStartsWith")
        XCTAssertEqual(SeriesParameter.TitleStartsWith("TitleStartsWith").value, "TitleStartsWith")
    }

    func testStartYear() {
        XCTAssertEqual(SeriesParameter.StartYear(1970).key, "startYear")
        XCTAssertEqual(SeriesParameter.StartYear(1970).value, "1970")
    }

    func testModifiedSince() {
        XCTAssertEqual(SeriesParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(SeriesParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testComics() {
        XCTAssertEqual(SeriesParameter.Comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(SeriesParameter.Comics([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(SeriesParameter.Stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(SeriesParameter.Stories([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(SeriesParameter.Events([1, 2, 3]).key, "events")
        XCTAssertEqual(SeriesParameter.Events([1, 2, 3]).value, "1,2,3")
    }

    func testCreators() {
        XCTAssertEqual(SeriesParameter.Creators([1, 2, 3]).key, "creators")
        XCTAssertEqual(SeriesParameter.Creators([1, 2, 3]).value, "1,2,3")
    }

    func testCharacters() {
        XCTAssertEqual(SeriesParameter.Characters([1, 2, 3]).key, "characters")
        XCTAssertEqual(SeriesParameter.Characters([1, 2, 3]).value, "1,2,3")
    }

    func testSeriesType() {
        // Collection
        XCTAssertEqual(SeriesParameter.SeriesType(.Collection).key, "seriesType")
        XCTAssertEqual(SeriesParameter.SeriesType(.Collection).value, "collection")
        // One shot
        XCTAssertEqual(SeriesParameter.SeriesType(.OneShot).key, "seriesType")
        XCTAssertEqual(SeriesParameter.SeriesType(.OneShot).value, "one shot")
        // Limited
        XCTAssertEqual(SeriesParameter.SeriesType(.Limited).key, "seriesType")
        XCTAssertEqual(SeriesParameter.SeriesType(.Limited).value, "limited")
        // Ongoing
        XCTAssertEqual(SeriesParameter.SeriesType(.Ongoing).key, "seriesType")
        XCTAssertEqual(SeriesParameter.SeriesType(.Ongoing).value, "ongoing")
    }

    func testContains() {
        XCTAssertEqual(SeriesParameter.Contains([.Comic, .Magazine, .TradePaperback, .Hardcover, .Digest, .GraphicNovel, .DigitalComic, .InfiniteComic]).key, "contains")
        XCTAssertEqual(SeriesParameter.Contains([.Comic, .Magazine, .TradePaperback, .Hardcover, .Digest, .GraphicNovel, .DigitalComic, .InfiniteComic]).value, "comic,magazine,trade paperback,hardcover,digest,graphic novel,digital comic,infinite comic")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(SeriesParameter.OrderBy([.TitleAscending, .ModifiedAscending, .StartYearAscending]).key, "orderBy")
        XCTAssertEqual(SeriesParameter.OrderBy([.TitleAscending, .ModifiedAscending, .StartYearAscending]).value, "title,modified,startYear")
        // Descending
        XCTAssertEqual(SeriesParameter.OrderBy([.TitleDescending, .ModifiedDescending, .StartYearDescending]).key, "orderBy")
        XCTAssertEqual(SeriesParameter.OrderBy([.TitleDescending, .ModifiedDescending, .StartYearDescending]).value, "-title,-modified,-startYear")
    }

    func testLimit() {
        XCTAssertEqual(SeriesParameter.Limit(1).key, "limit")
        XCTAssertEqual(SeriesParameter.Limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(SeriesParameter.Offset(1).key, "offset")
        XCTAssertEqual(SeriesParameter.Offset(1).value, "1")
    }

}
