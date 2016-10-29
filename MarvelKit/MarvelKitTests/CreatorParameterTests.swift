//
//  CreatorParameterTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class CreatorParameterTests: XCTestCase {

    func testFirstName() {
        XCTAssertEqual(CreatorParameter.firstName("FirstName").key, "firstName")
        XCTAssertEqual(CreatorParameter.firstName("FirstName").value, "FirstName")
    }

    func testMiddleName() {
        XCTAssertEqual(CreatorParameter.middleName("MiddleName").key, "middleName")
        XCTAssertEqual(CreatorParameter.middleName("MiddleName").value, "MiddleName")
    }

    func testLastName() {
        XCTAssertEqual(CreatorParameter.lastName("LastName").key, "lastName")
        XCTAssertEqual(CreatorParameter.lastName("LastName").value, "LastName")
    }

    func testSuffix() {
        XCTAssertEqual(CreatorParameter.suffix("Suffix").key, "suffix")
        XCTAssertEqual(CreatorParameter.suffix("Suffix").value, "Suffix")
    }

    func testNameStartsWith() {
        XCTAssertEqual(CreatorParameter.nameStartsWith("NameStartsWith").key, "nameStartsWith")
        XCTAssertEqual(CreatorParameter.nameStartsWith("NameStartsWith").value, "NameStartsWith")
    }

    func testFirstNameStartsWith() {
        XCTAssertEqual(CreatorParameter.firstNameStartsWith("FirstNameStartsWith").key, "firstNameStartsWith")
        XCTAssertEqual(CreatorParameter.firstNameStartsWith("FirstNameStartsWith").value, "FirstNameStartsWith")
    }

    func testMiddleNameStartsWith() {
        XCTAssertEqual(CreatorParameter.middleNameStartsWith("MiddleNameStartsWith").key, "middleNameStartsWith")
        XCTAssertEqual(CreatorParameter.middleNameStartsWith("MiddleNameStartsWith").value, "MiddleNameStartsWith")
    }

    func testLastNameStartsWith() {
        XCTAssertEqual(CreatorParameter.lastNameStartsWith("LastNameStartsWith").key, "lastNameStartsWith")
        XCTAssertEqual(CreatorParameter.lastNameStartsWith("LastNameStartsWith").value, "LastNameStartsWith")
    }

    func testModifiedSince() {
        XCTAssertEqual(CreatorParameter.modifiedSince(Date(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(CreatorParameter.modifiedSince(Date(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testComics() {
        XCTAssertEqual(CreatorParameter.comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(CreatorParameter.comics([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(CreatorParameter.series([1, 2, 3]).key, "series")
        XCTAssertEqual(CreatorParameter.series([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(CreatorParameter.events([1, 2, 3]).key, "events")
        XCTAssertEqual(CreatorParameter.events([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(CreatorParameter.stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(CreatorParameter.stories([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(CreatorParameter.orderBy([.FirstNameAscending, .MiddleNameAscending, .LastNameAscending, .SuffixAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(CreatorParameter.orderBy([.FirstNameAscending, .MiddleNameAscending, .LastNameAscending, .SuffixAscending, .ModifiedAscending]).value, "firstName,middleName,lastName,suffix,modified")
        // Descending
        XCTAssertEqual(CreatorParameter.orderBy([.FirstNameDescending, .MiddleNameDescending, .LastNameDescending, .SuffixDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(CreatorParameter.orderBy([.FirstNameDescending, .MiddleNameDescending, .LastNameDescending, .SuffixDescending, .ModifiedDescending]).value, "-firstName,-middleName,-lastName,-suffix,-modified")
    }

    func testLimit() {
        XCTAssertEqual(CreatorParameter.limit(1).key, "limit")
        XCTAssertEqual(CreatorParameter.limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(CreatorParameter.offset(1).key, "offset")
        XCTAssertEqual(CreatorParameter.offset(1).value, "1")
    }

}
