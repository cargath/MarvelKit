//
//  ComicParameterTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class ComicParameterTests: XCTestCase {

    func testFormat() {
        // Comic
        XCTAssertEqual(ComicParameter.format(.Comic).key, "format")
        XCTAssertEqual(ComicParameter.format(.Comic).value, "comic")
        // Magazine
        XCTAssertEqual(ComicParameter.format(.Magazine).key, "format")
        XCTAssertEqual(ComicParameter.format(.Magazine).value, "magazine")
        // Trade paperback
        XCTAssertEqual(ComicParameter.format(.TradePaperback).key, "format")
        XCTAssertEqual(ComicParameter.format(.TradePaperback).value, "trade paperback")
        // Hardcover
        XCTAssertEqual(ComicParameter.format(.Hardcover).key, "format")
        XCTAssertEqual(ComicParameter.format(.Hardcover).value, "hardcover")
        // Digest
        XCTAssertEqual(ComicParameter.format(.Digest).key, "format")
        XCTAssertEqual(ComicParameter.format(.Digest).value, "digest")
        // Graphic novel
        XCTAssertEqual(ComicParameter.format(.GraphicNovel).key, "format")
        XCTAssertEqual(ComicParameter.format(.GraphicNovel).value, "graphic novel")
        // Digital comic
        XCTAssertEqual(ComicParameter.format(.DigitalComic).key, "format")
        XCTAssertEqual(ComicParameter.format(.DigitalComic).value, "digital comic")
        // Infinite comic
        XCTAssertEqual(ComicParameter.format(.InfiniteComic).key, "format")
        XCTAssertEqual(ComicParameter.format(.InfiniteComic).value, "infinite comic")
    }

    func testFormatType() {
        // Comic
        XCTAssertEqual(ComicParameter.formatType(.Comic).key, "formatType")
        XCTAssertEqual(ComicParameter.formatType(.Comic).value, "comic")
        // Collection
        XCTAssertEqual(ComicParameter.formatType(.Collection).key, "formatType")
        XCTAssertEqual(ComicParameter.formatType(.Collection).value, "collection")
    }

    func testNoVariants() {
        // true
        XCTAssertEqual(ComicParameter.noVariants(true).key, "noVariants")
        XCTAssertEqual(ComicParameter.noVariants(true).value, "true")
        // false
        XCTAssertEqual(ComicParameter.noVariants(false).key, "noVariants")
        XCTAssertEqual(ComicParameter.noVariants(false).value, "false")
    }

    func testDateDescriptor() {
        // Last week
        XCTAssertEqual(ComicParameter.dateDescriptor(.LastWeek).key, "dateDescriptor")
        XCTAssertEqual(ComicParameter.dateDescriptor(.LastWeek).value, "lastWeek")
        // This week
        XCTAssertEqual(ComicParameter.dateDescriptor(.ThisWeek).key, "dateDescriptor")
        XCTAssertEqual(ComicParameter.dateDescriptor(.ThisWeek).value, "thisWeek")
        // Next week
        XCTAssertEqual(ComicParameter.dateDescriptor(.NextWeek).key, "dateDescriptor")
        XCTAssertEqual(ComicParameter.dateDescriptor(.NextWeek).value, "nextWeek")
        // This month
        XCTAssertEqual(ComicParameter.dateDescriptor(.ThisMonth).key, "dateDescriptor")
        XCTAssertEqual(ComicParameter.dateDescriptor(.ThisMonth).value, "thisMonth")
    }

    func testDateRange() {
        XCTAssertEqual(ComicParameter.dateRange(Date(timeIntervalSince1970: 0), Date(timeIntervalSince1970: 0)).key, "dateRange")
        XCTAssertEqual(ComicParameter.dateRange(Date(timeIntervalSince1970: 0), Date(timeIntervalSince1970: 0)).value, "1970-01-01,1970-01-01")
    }

    func testTitle() {
        XCTAssertEqual(ComicParameter.title("Title").key, "title")
        XCTAssertEqual(ComicParameter.title("Title").value, "Title")
    }

    func testTitleStartsWith() {
        XCTAssertEqual(ComicParameter.titleStartsWith("TitleStartsWith").key, "titleStartsWith")
        XCTAssertEqual(ComicParameter.titleStartsWith("TitleStartsWith").value, "TitleStartsWith")
    }

    func testStartYear() {
        XCTAssertEqual(ComicParameter.startYear(1970).key, "startYear")
        XCTAssertEqual(ComicParameter.startYear(1970).value, "1970")
    }

    func testIssueNumber() {
        XCTAssertEqual(ComicParameter.issueNumber(1).key, "issueNumber")
        XCTAssertEqual(ComicParameter.issueNumber(1).value, "1")
    }

    func testDiamondCode() {
        XCTAssertEqual(ComicParameter.diamondCode("DiamondCode").key, "diamondCode")
        XCTAssertEqual(ComicParameter.diamondCode("DiamondCode").value, "DiamondCode")
    }

    func testDigitalID() {
        XCTAssertEqual(ComicParameter.digitalID(1).key, "digitalId")
        XCTAssertEqual(ComicParameter.digitalID(1).value, "1")
    }

    func testUPC() {
        XCTAssertEqual(ComicParameter.upc("UPC").key, "upc")
        XCTAssertEqual(ComicParameter.upc("UPC").value, "UPC")
    }

    func testISBN() {
        XCTAssertEqual(ComicParameter.isbn("ISBN").key, "isbn")
        XCTAssertEqual(ComicParameter.isbn("ISBN").value, "ISBN")
    }

    func testEAN() {
        XCTAssertEqual(ComicParameter.ean("EAN").key, "ean")
        XCTAssertEqual(ComicParameter.ean("EAN").value, "EAN")
    }

    func testISSN() {
        XCTAssertEqual(ComicParameter.issn("ISSN").key, "issn")
        XCTAssertEqual(ComicParameter.issn("ISSN").value, "ISSN")
    }

    func testHasDigitalIssue() {
        // true
        XCTAssertEqual(ComicParameter.hasDigitalIssue(true).key, "hasDigitalIssue")
        XCTAssertEqual(ComicParameter.hasDigitalIssue(true).value, "true")
        // false
        XCTAssertEqual(ComicParameter.hasDigitalIssue(false).key, "hasDigitalIssue")
        XCTAssertEqual(ComicParameter.hasDigitalIssue(false).value, "false")
    }

    func testModifiedSince() {
        XCTAssertEqual(ComicParameter.modifiedSince(Date(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(ComicParameter.modifiedSince(Date(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testCreators() {
        XCTAssertEqual(ComicParameter.creators([1, 2, 3]).key, "creators")
        XCTAssertEqual(ComicParameter.creators([1, 2, 3]).value, "1,2,3")
    }

    func testCharacters() {
        XCTAssertEqual(ComicParameter.characters([1, 2, 3]).key, "characters")
        XCTAssertEqual(ComicParameter.characters([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(ComicParameter.series([1, 2, 3]).key, "series")
        XCTAssertEqual(ComicParameter.series([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(ComicParameter.events([1, 2, 3]).key, "events")
        XCTAssertEqual(ComicParameter.events([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(ComicParameter.stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(ComicParameter.stories([1, 2, 3]).value, "1,2,3")
    }

    func testSharedAppearances() {
        XCTAssertEqual(ComicParameter.sharedAppearances([1, 2, 3]).key, "sharedAppearances")
        XCTAssertEqual(ComicParameter.sharedAppearances([1, 2, 3]).value, "1,2,3")
    }

    func testCollaborators() {
        XCTAssertEqual(ComicParameter.collaborators([1, 2, 3]).key, "collaborators")
        XCTAssertEqual(ComicParameter.collaborators([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(ComicParameter.orderBy([.FOCDateAscending, .OnSaleDateAscending, .TitleAscending, .IssueNumberAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(ComicParameter.orderBy([.FOCDateAscending, .OnSaleDateAscending, .TitleAscending, .IssueNumberAscending, .ModifiedAscending]).value, "focDate,onsaleDate,title,issueNumber,modified")
        // Descending
        XCTAssertEqual(ComicParameter.orderBy([.FOCDateDescending, .OnSaleDateDescending, .TitleDescending, .IssueNumberDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(ComicParameter.orderBy([.FOCDateDescending, .OnSaleDateDescending, .TitleDescending, .IssueNumberDescending, .ModifiedDescending]).value, "-focDate,-onsaleDate,-title,-issueNumber,-modified")
    }

    func testLimit() {
        XCTAssertEqual(ComicParameter.limit(1).key, "limit")
        XCTAssertEqual(ComicParameter.limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(ComicParameter.offset(1).key, "offset")
        XCTAssertEqual(ComicParameter.offset(1).value, "1")
    }

}
