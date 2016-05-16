//
//  EventParameterTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class EventParameterTests: XCTestCase {

    func testName() {
        XCTAssertEqual(EventParameter.Name("Name").key, "name")
        XCTAssertEqual(EventParameter.Name("Name").value, "Name")
    }

    func testNameStartsWith() {
        XCTAssertEqual(EventParameter.NameStartsWith("NameStartsWith").key, "nameStartsWith")
        XCTAssertEqual(EventParameter.NameStartsWith("NameStartsWith").value, "NameStartsWith")
    }

    func testModifiedSince() {
        XCTAssertEqual(EventParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(EventParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testCreators() {
        XCTAssertEqual(EventParameter.Creators([1, 2, 3]).key, "creators")
        XCTAssertEqual(EventParameter.Creators([1, 2, 3]).value, "1,2,3")
    }

    func testCharacters() {
        XCTAssertEqual(EventParameter.Characters([1, 2, 3]).key, "characters")
        XCTAssertEqual(EventParameter.Characters([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(EventParameter.Series([1, 2, 3]).key, "series")
        XCTAssertEqual(EventParameter.Series([1, 2, 3]).value, "1,2,3")
    }

    func testComics() {
        XCTAssertEqual(EventParameter.Comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(EventParameter.Comics([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(EventParameter.Stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(EventParameter.Stories([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(EventParameter.OrderBy([.NameAscending, .StartDateAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(EventParameter.OrderBy([.NameAscending, .StartDateAscending, .ModifiedAscending]).value, "name,startDate,modified")
        // Descending
        XCTAssertEqual(EventParameter.OrderBy([.NameDescending, .StartDateDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(EventParameter.OrderBy([.NameDescending, .StartDateDescending, .ModifiedDescending]).value, "-name,-startDate,-modified")
    }

    func testLimit() {
        XCTAssertEqual(EventParameter.Limit(1).key, "limit")
        XCTAssertEqual(EventParameter.Limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(EventParameter.Offset(1).key, "offset")
        XCTAssertEqual(EventParameter.Offset(1).value, "1")
    }

}
