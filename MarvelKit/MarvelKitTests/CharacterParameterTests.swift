//
//  CharacterParameterTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class CharacterParameterTests: XCTestCase {

    func testName() {
        XCTAssertEqual(CharacterParameter.Name("Name").key, "name")
        XCTAssertEqual(CharacterParameter.Name("Name").value, "Name")
    }

    func testNameStartsWith() {
        XCTAssertEqual(CharacterParameter.NameStartsWith("NameStartsWith").key, "nameStartsWith")
        XCTAssertEqual(CharacterParameter.NameStartsWith("NameStartsWith").value, "NameStartsWith")
    }

    func testModifiedSince() {
        XCTAssertEqual(CharacterParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(CharacterParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testComics() {
        XCTAssertEqual(CharacterParameter.Comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(CharacterParameter.Comics([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(CharacterParameter.Series([1, 2, 3]).key, "series")
        XCTAssertEqual(CharacterParameter.Series([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(CharacterParameter.Events([1, 2, 3]).key, "events")
        XCTAssertEqual(CharacterParameter.Events([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(CharacterParameter.Stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(CharacterParameter.Stories([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(CharacterParameter.OrderBy([.NameAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(CharacterParameter.OrderBy([.NameAscending, .ModifiedAscending]).value, "name,modified")
        // Descending
        XCTAssertEqual(CharacterParameter.OrderBy([.NameDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(CharacterParameter.OrderBy([.NameDescending, .ModifiedDescending]).value, "-name,-modified")
    }

    func testLimit() {
        XCTAssertEqual(CharacterParameter.Limit(1).key, "limit")
        XCTAssertEqual(CharacterParameter.Limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(CharacterParameter.Offset(1).key, "offset")
        XCTAssertEqual(CharacterParameter.Offset(1).value, "1")
    }

}
