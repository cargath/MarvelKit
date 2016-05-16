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
        XCTAssertEqual(StoryParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(StoryParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testComics() {
        XCTAssertEqual(StoryParameter.Comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(StoryParameter.Comics([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(StoryParameter.Series([1, 2, 3]).key, "series")
        XCTAssertEqual(StoryParameter.Series([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(StoryParameter.Events([1, 2, 3]).key, "events")
        XCTAssertEqual(StoryParameter.Events([1, 2, 3]).value, "1,2,3")
    }

    func testCreators() {
        XCTAssertEqual(StoryParameter.Creators([1, 2, 3]).key, "creators")
        XCTAssertEqual(StoryParameter.Creators([1, 2, 3]).value, "1,2,3")
    }

    func testCharacters() {
        XCTAssertEqual(StoryParameter.Characters([1, 2, 3]).key, "characters")
        XCTAssertEqual(StoryParameter.Characters([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(StoryParameter.OrderBy([.IDAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(StoryParameter.OrderBy([.IDAscending, .ModifiedAscending]).value, "id,modified")
        // Descending
        XCTAssertEqual(StoryParameter.OrderBy([.IDDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(StoryParameter.OrderBy([.IDDescending, .ModifiedDescending]).value, "-id,-modified")
    }

    func testLimit() {
        XCTAssertEqual(StoryParameter.Limit(1).key, "limit")
        XCTAssertEqual(StoryParameter.Limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(StoryParameter.Offset(1).key, "offset")
        XCTAssertEqual(StoryParameter.Offset(1).value, "1")
    }

}
