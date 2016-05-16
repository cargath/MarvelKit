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
        XCTAssertEqual(ComicParameter.Format(.Comic).key, "format")
        XCTAssertEqual(ComicParameter.Format(.Comic).value, "comic")
        // Magazine
        XCTAssertEqual(ComicParameter.Format(.Magazine).key, "format")
        XCTAssertEqual(ComicParameter.Format(.Magazine).value, "magazine")
        // Trade paperback
        XCTAssertEqual(ComicParameter.Format(.TradePaperback).key, "format")
        XCTAssertEqual(ComicParameter.Format(.TradePaperback).value, "trade paperback")
        // Hardcover
        XCTAssertEqual(ComicParameter.Format(.Hardcover).key, "format")
        XCTAssertEqual(ComicParameter.Format(.Hardcover).value, "hardcover")
        // Digest
        XCTAssertEqual(ComicParameter.Format(.Digest).key, "format")
        XCTAssertEqual(ComicParameter.Format(.Digest).value, "digest")
        // Graphic novel
        XCTAssertEqual(ComicParameter.Format(.GraphicNovel).key, "format")
        XCTAssertEqual(ComicParameter.Format(.GraphicNovel).value, "graphic novel")
        // Digital comic
        XCTAssertEqual(ComicParameter.Format(.DigitalComic).key, "format")
        XCTAssertEqual(ComicParameter.Format(.DigitalComic).value, "digital comic")
        // Infinite comic
        XCTAssertEqual(ComicParameter.Format(.InfiniteComic).key, "format")
        XCTAssertEqual(ComicParameter.Format(.InfiniteComic).value, "infinite comic")
    }

    func testFormatType() {
        // Comic
        XCTAssertEqual(ComicParameter.FormatType(.Comic).key, "formatType")
        XCTAssertEqual(ComicParameter.FormatType(.Comic).value, "comic")
        // Collection
        XCTAssertEqual(ComicParameter.FormatType(.Collection).key, "formatType")
        XCTAssertEqual(ComicParameter.FormatType(.Collection).value, "collection")
    }

    func testNoVariants() {
        // true
        XCTAssertEqual(ComicParameter.NoVariants(true).key, "noVariants")
        XCTAssertEqual(ComicParameter.NoVariants(true).value, "true")
        // false
        XCTAssertEqual(ComicParameter.NoVariants(false).key, "noVariants")
        XCTAssertEqual(ComicParameter.NoVariants(false).value, "false")
    }

    func testDateDescriptor() {
        // Last week
        XCTAssertEqual(ComicParameter.DateDescriptor(.LastWeek).key, "dateDescriptor")
        XCTAssertEqual(ComicParameter.DateDescriptor(.LastWeek).value, "lastWeek")
        // This week
        XCTAssertEqual(ComicParameter.DateDescriptor(.ThisWeek).key, "dateDescriptor")
        XCTAssertEqual(ComicParameter.DateDescriptor(.ThisWeek).value, "thisWeek")
        // Next week
        XCTAssertEqual(ComicParameter.DateDescriptor(.NextWeek).key, "dateDescriptor")
        XCTAssertEqual(ComicParameter.DateDescriptor(.NextWeek).value, "nextWeek")
        // This month
        XCTAssertEqual(ComicParameter.DateDescriptor(.ThisMonth).key, "dateDescriptor")
        XCTAssertEqual(ComicParameter.DateDescriptor(.ThisMonth).value, "thisMonth")
    }

    func testDateRange() {
        XCTAssertEqual(ComicParameter.DateRange(NSDate(timeIntervalSince1970: 0), NSDate(timeIntervalSince1970: 0)).key, "dateRange")
        XCTAssertEqual(ComicParameter.DateRange(NSDate(timeIntervalSince1970: 0), NSDate(timeIntervalSince1970: 0)).value, "1970-01-01,1970-01-01")
    }

    func testTitle() {
        XCTAssertEqual(ComicParameter.Title("Title").key, "title")
        XCTAssertEqual(ComicParameter.Title("Title").value, "Title")
    }

    func testTitleStartsWith() {
        XCTAssertEqual(ComicParameter.TitleStartsWith("TitleStartsWith").key, "titleStartsWith")
        XCTAssertEqual(ComicParameter.TitleStartsWith("TitleStartsWith").value, "TitleStartsWith")
    }

    func testStartYear() {
        XCTAssertEqual(ComicParameter.StartYear(1970).key, "startYear")
        XCTAssertEqual(ComicParameter.StartYear(1970).value, "1970")
    }

    func testIssueNumber() {
        XCTAssertEqual(ComicParameter.IssueNumber(1).key, "issueNumber")
        XCTAssertEqual(ComicParameter.IssueNumber(1).value, "1")
    }

    func testDiamondCode() {
        XCTAssertEqual(ComicParameter.DiamondCode("DiamondCode").key, "diamondCode")
        XCTAssertEqual(ComicParameter.DiamondCode("DiamondCode").value, "DiamondCode")
    }

    func testDigitalID() {
        XCTAssertEqual(ComicParameter.DigitalID(1).key, "digitalId")
        XCTAssertEqual(ComicParameter.DigitalID(1).value, "1")
    }

    func testUPC() {
        XCTAssertEqual(ComicParameter.UPC("UPC").key, "upc")
        XCTAssertEqual(ComicParameter.UPC("UPC").value, "UPC")
    }

    func testISBN() {
        XCTAssertEqual(ComicParameter.ISBN("ISBN").key, "isbn")
        XCTAssertEqual(ComicParameter.ISBN("ISBN").value, "ISBN")
    }

    func testEAN() {
        XCTAssertEqual(ComicParameter.EAN("EAN").key, "ean")
        XCTAssertEqual(ComicParameter.EAN("EAN").value, "EAN")
    }

    func testISSN() {
        XCTAssertEqual(ComicParameter.ISSN("ISSN").key, "issn")
        XCTAssertEqual(ComicParameter.ISSN("ISSN").value, "ISSN")
    }

    func testHasDigitalIssue() {
        // true
        XCTAssertEqual(ComicParameter.HasDigitalIssue(true).key, "hasDigitalIssue")
        XCTAssertEqual(ComicParameter.HasDigitalIssue(true).value, "true")
        // false
        XCTAssertEqual(ComicParameter.HasDigitalIssue(false).key, "hasDigitalIssue")
        XCTAssertEqual(ComicParameter.HasDigitalIssue(false).value, "false")
    }

    func testModifiedSince() {
        XCTAssertEqual(ComicParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).key, "modifiedSince")
        XCTAssertEqual(ComicParameter.ModifiedSince(NSDate(timeIntervalSince1970: 0)).value, "1970-01-01")
    }

    func testCreators() {
        XCTAssertEqual(ComicParameter.Creators([1, 2, 3]).key, "creators")
        XCTAssertEqual(ComicParameter.Creators([1, 2, 3]).value, "1,2,3")
    }

    func testCharacters() {
        XCTAssertEqual(ComicParameter.Characters([1, 2, 3]).key, "characters")
        XCTAssertEqual(ComicParameter.Characters([1, 2, 3]).value, "1,2,3")
    }

    func testSeries() {
        XCTAssertEqual(ComicParameter.Series([1, 2, 3]).key, "series")
        XCTAssertEqual(ComicParameter.Series([1, 2, 3]).value, "1,2,3")
    }

    func testEvents() {
        XCTAssertEqual(ComicParameter.Events([1, 2, 3]).key, "events")
        XCTAssertEqual(ComicParameter.Events([1, 2, 3]).value, "1,2,3")
    }

    func testStories() {
        XCTAssertEqual(ComicParameter.Stories([1, 2, 3]).key, "stories")
        XCTAssertEqual(ComicParameter.Stories([1, 2, 3]).value, "1,2,3")
    }

    func testSharedAppearances() {
        XCTAssertEqual(ComicParameter.SharedAppearances([1, 2, 3]).key, "sharedAppearances")
        XCTAssertEqual(ComicParameter.SharedAppearances([1, 2, 3]).value, "1,2,3")
    }

    func testCollaborators() {
        XCTAssertEqual(ComicParameter.Collaborators([1, 2, 3]).key, "collaborators")
        XCTAssertEqual(ComicParameter.Collaborators([1, 2, 3]).value, "1,2,3")
    }

    func testOrderBy() {
        // Ascending
        XCTAssertEqual(ComicParameter.OrderBy([.FOCDateAscending, .OnSaleDateAscending, .TitleAscending, .IssueNumberAscending, .ModifiedAscending]).key, "orderBy")
        XCTAssertEqual(ComicParameter.OrderBy([.FOCDateAscending, .OnSaleDateAscending, .TitleAscending, .IssueNumberAscending, .ModifiedAscending]).value, "focDate,onsaleDate,title,issueNumber,modified")
        // Descending
        XCTAssertEqual(ComicParameter.OrderBy([.FOCDateDescending, .OnSaleDateDescending, .TitleDescending, .IssueNumberDescending, .ModifiedDescending]).key, "orderBy")
        XCTAssertEqual(ComicParameter.OrderBy([.FOCDateDescending, .OnSaleDateDescending, .TitleDescending, .IssueNumberDescending, .ModifiedDescending]).value, "-focDate,-onsaleDate,-title,-issueNumber,-modified")
    }

    func testLimit() {
        XCTAssertEqual(ComicParameter.Limit(1).key, "limit")
        XCTAssertEqual(ComicParameter.Limit(1).value, "1")
    }

    func testOffset() {
        XCTAssertEqual(ComicParameter.Offset(1).key, "offset")
        XCTAssertEqual(ComicParameter.Offset(1).value, "1")
    }

}
