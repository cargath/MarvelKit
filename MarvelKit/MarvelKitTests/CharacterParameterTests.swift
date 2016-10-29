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
        XCTAssertEqual(CharacterParameter.name("Name").key, "name")
        XCTAssertEqual(CharacterParameter.name("Name").value, "Name")
    }

    func testNameStartsWith() {
        XCTAssertEqual(CharacterParameter.nameStartsWith("NameStartsWith").key, "nameStartsWith")
        XCTAssertEqual(CharacterParameter.nameStartsWith("NameStartsWith").value, "NameStartsWith")
    }

    func testModifiedSince() {
        XCTAssertEqual(CharacterParameter.modifiedSince(Date(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(CharacterParameter.modifiedSince(Date(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testComics() {
        XCTAssertEqual(CharacterParameter.comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(CharacterParameter.comics([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(CharacterParameter.series([1, 2, 3]).key, "series")
        XCTAssertEqual(CharacterParameter.series([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(CharacterParameter.events([1, 2, 3]).key, "events")
        XCTAssertEqual(CharacterParameter.events([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(CharacterParameter.stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(CharacterParameter.stories([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(CharacterParameter.orderBy([.NameAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(CharacterParameter.orderBy([.NameAscending, .ModifiedAscending]).value, "name,modified")
        // Descending
        XCTAssertEqual(CharacterParameter.orderBy([.NameDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(CharacterParameter.orderBy([.NameDescending, .ModifiedDescending]).value, "-name,-modified")
    }

    func testLimit() {
        XCTAssertEqual(CharacterParameter.limit(1).key, "limit")
        XCTAssertEqual(CharacterParameter.limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(CharacterParameter.offset(1).key, "offset")
        XCTAssertEqual(CharacterParameter.offset(1).value, "1")
    }

}
