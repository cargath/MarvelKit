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
        XCTAssertEqual(EventParameter.name("Name").key, "name")
        XCTAssertEqual(EventParameter.name("Name").value, "Name")
    }

    func testNameStartsWith() {
        XCTAssertEqual(EventParameter.nameStartsWith("NameStartsWith").key, "nameStartsWith")
        XCTAssertEqual(EventParameter.nameStartsWith("NameStartsWith").value, "NameStartsWith")
    }

    func testModifiedSince() {
        XCTAssertEqual(EventParameter.modifiedSince(Date(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(EventParameter.modifiedSince(Date(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testCreators() {
        XCTAssertEqual(EventParameter.creators([1, 2, 3]).key, "creators")
        XCTAssertEqual(EventParameter.creators([1, 2, 3]).value, "1,2,3")
    }

    func testCharacters() {
        XCTAssertEqual(EventParameter.characters([1, 2, 3]).key, "characters")
        XCTAssertEqual(EventParameter.characters([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(EventParameter.series([1, 2, 3]).key, "series")
        XCTAssertEqual(EventParameter.series([1, 2, 3]).value, "1,2,3")
    }

    func testComics() {
        XCTAssertEqual(EventParameter.comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(EventParameter.comics([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(EventParameter.stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(EventParameter.stories([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(EventParameter.orderBy([.NameAscending, .StartDateAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(EventParameter.orderBy([.NameAscending, .StartDateAscending, .ModifiedAscending]).value, "name,startDate,modified")
        // Descending
        XCTAssertEqual(EventParameter.orderBy([.NameDescending, .StartDateDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(EventParameter.orderBy([.NameDescending, .StartDateDescending, .ModifiedDescending]).value, "-name,-startDate,-modified")
    }

    func testLimit() {
        XCTAssertEqual(EventParameter.limit(1).key, "limit")
        XCTAssertEqual(EventParameter.limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(EventParameter.offset(1).key, "offset")
        XCTAssertEqual(EventParameter.offset(1).value, "1")
    }

}
