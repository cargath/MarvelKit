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
        XCTAssertEqual(CreatorParameter.FirstName("FirstName").key, "firstName")
        XCTAssertEqual(CreatorParameter.FirstName("FirstName").value, "FirstName")
    }

    func testMiddleName() {
        XCTAssertEqual(CreatorParameter.MiddleName("MiddleName").key, "middleName")
        XCTAssertEqual(CreatorParameter.MiddleName("MiddleName").value, "MiddleName")
    }

    func testLastName() {
        XCTAssertEqual(CreatorParameter.LastName("LastName").key, "lastName")
        XCTAssertEqual(CreatorParameter.LastName("LastName").value, "LastName")
    }

    func testSuffix() {
        XCTAssertEqual(CreatorParameter.Suffix("Suffix").key, "suffix")
        XCTAssertEqual(CreatorParameter.Suffix("Suffix").value, "Suffix")
    }

    func testNameStartsWith() {
        XCTAssertEqual(CreatorParameter.NameStartsWith("NameStartsWith").key, "nameStartsWith")
        XCTAssertEqual(CreatorParameter.NameStartsWith("NameStartsWith").value, "NameStartsWith")
    }

    func testFirstNameStartsWith() {
        XCTAssertEqual(CreatorParameter.FirstNameStartsWith("FirstNameStartsWith").key, "firstNameStartsWith")
        XCTAssertEqual(CreatorParameter.FirstNameStartsWith("FirstNameStartsWith").value, "FirstNameStartsWith")
    }

    func testMiddleNameStartsWith() {
        XCTAssertEqual(CreatorParameter.MiddleNameStartsWith("MiddleNameStartsWith").key, "middleNameStartsWith")
        XCTAssertEqual(CreatorParameter.MiddleNameStartsWith("MiddleNameStartsWith").value, "MiddleNameStartsWith")
    }

    func testLastNameStartsWith() {
        XCTAssertEqual(CreatorParameter.LastNameStartsWith("LastNameStartsWith").key, "lastNameStartsWith")
        XCTAssertEqual(CreatorParameter.LastNameStartsWith("LastNameStartsWith").value, "LastNameStartsWith")
    }

    func testModifiedSince() {
        XCTAssertEqual(CreatorParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(CreatorParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testComics() {
        XCTAssertEqual(CreatorParameter.Comics([1, 2, 3]).key, "comics")
        XCTAssertEqual(CreatorParameter.Comics([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(CreatorParameter.Series([1, 2, 3]).key, "series")
        XCTAssertEqual(CreatorParameter.Series([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(CreatorParameter.Events([1, 2, 3]).key, "events")
        XCTAssertEqual(CreatorParameter.Events([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(CreatorParameter.Stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(CreatorParameter.Stories([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(CreatorParameter.OrderBy([.FirstNameAscending, .MiddleNameAscending, .LastNameAscending, .SuffixAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(CreatorParameter.OrderBy([.FirstNameAscending, .MiddleNameAscending, .LastNameAscending, .SuffixAscending, .ModifiedAscending]).value, "firstName,middleName,lastName,suffix,modified")
        // Descending
        XCTAssertEqual(CreatorParameter.OrderBy([.FirstNameDescending, .MiddleNameDescending, .LastNameDescending, .SuffixDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(CreatorParameter.OrderBy([.FirstNameDescending, .MiddleNameDescending, .LastNameDescending, .SuffixDescending, .ModifiedDescending]).value, "-firstName,-middleName,-lastName,-suffix,-modified")
    }

    func testLimit() {
        XCTAssertEqual(CreatorParameter.Limit(1).key, "limit")
        XCTAssertEqual(CreatorParameter.Limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(CreatorParameter.Offset(1).key, "offset")
        XCTAssertEqual(CreatorParameter.Offset(1).value, "1")
    }

}
