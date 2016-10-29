//
//  StoryParameterTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class StoryParameterTests: XCTestCase {

    func testModifiedSince() {
        XCTAssertEqual(StoryParameter.modifiedSince(Date(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(StoryParameter.modifiedSince(Date(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testComics() {
        XCTAssertEqual(StoryParameter.comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(StoryParameter.comics([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(StoryParameter.series([1, 2, 3]).key, "series")
        XCTAssertEqual(StoryParameter.series([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(StoryParameter.events([1, 2, 3]).key, "events")
        XCTAssertEqual(StoryParameter.events([1, 2, 3]).value, "1,2,3")
    }

    func testCreators() {
        XCTAssertEqual(StoryParameter.creators([1, 2, 3]).key, "creators")
        XCTAssertEqual(StoryParameter.creators([1, 2, 3]).value, "1,2,3")
    }

    func testCharacters() {
        XCTAssertEqual(StoryParameter.characters([1, 2, 3]).key, "characters")
        XCTAssertEqual(StoryParameter.characters([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(StoryParameter.orderBy([.IDAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(StoryParameter.orderBy([.IDAscending, .ModifiedAscending]).value, "id,modified")
        // Descending
        XCTAssertEqual(StoryParameter.orderBy([.IDDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(StoryParameter.orderBy([.IDDescending, .ModifiedDescending]).value, "-id,-modified")
    }

    func testLimit() {
        XCTAssertEqual(StoryParameter.limit(1).key, "limit")
        XCTAssertEqual(StoryParameter.limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(StoryParameter.offset(1).key, "offset")
        XCTAssertEqual(StoryParameter.offset(1).value, "1")
    }

}
