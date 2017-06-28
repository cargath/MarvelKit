//
//  ImageTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 25.06.2017.
//  Copyright © 2017 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class ImageTests: XCTestCase {
    
    var image: Image?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        image = Image(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73", extension: "jpg")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFull() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73.jpg")
    }
    
    func testPortraitSmall() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .portraitSmall), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_small.jpg")
    }
    
    func testPortraitMedium() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .portraitMedium), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_medium.jpg")
    }
    
    func testPortraitXLarge() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .portraitXLarge), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_xlarge.jpg")
    }
    
    func testPortraitFantastic() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .portraitFantastic), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_fantastic.jpg")
    }
    
    func testPortraitIncredible() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .portraitIncredible), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_incredible.jpg")
    }
    
    func testPortraitUncanny() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .portraitUncanny), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_uncanny.jpg")
    }
    
    func testStandardSmall() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .standardSmall), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_small.jpg")
    }
    
    func testStandardMedium() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .standardMedium), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_medium.jpg")
    }
    
    func testStandardLarge() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .standardLarge), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_large.jpg")
    }
    
    func testStandardAmazing() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .standardAmazing), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_amazing.jpg")
    }
    
    func testStandardXLarge() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .standardXLarge), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_xlarge.jpg")
    }
    
    func testStandardFantastic() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .standardFantastic), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/standard_fantastic.jpg")
    }
    
    func testLandscapeSmall() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .landscapeSmall), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/landscape_small.jpg")
    }
    
    func testLandscapeMedium() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .landscapeMedium), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/landscape_medium.jpg")
    }
    
    func testLandscapeLarge() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .landscapeLarge), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/landscape_large.jpg")
    }
    
    func testLandscapeAmazing() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .landscapeAmazing), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/landscape_amazing.jpg")
    }
    
    func testLandscapeXLarge() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .landscapeXLarge), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/landscape_xlarge.jpg")
    }
    
    func testLandscapeIncredible() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .landscapeIncredible), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/landscape_incredible.jpg")
    }
    
    func testDetail() {
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.urlString(size: .detail), "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/detail.jpg")
    }
    
}
