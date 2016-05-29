//
//  ComicURLTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class ComicURLTests: XCTestCase {

    func testRequestURL() {
        XCTAssertEqual(Comic.absoluteURL()?.absoluteString, "https://gateway.marvel.com/v1/public/comics")
    }

    func testRequestURLWithID() {
        XCTAssertEqual(Comic.absoluteURL(id: 42)?.absoluteString, "https://gateway.marvel.com/v1/public/comics/42")
    }

    func testRequestURLWithFilter() {
        XCTAssertEqual(Comic.absoluteURL(filter: ResourceFilter(.Characters, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/characters/42/comics")
        XCTAssertEqual(Comic.absoluteURL(filter: ResourceFilter(.Creators, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/creators/42/comics")
        XCTAssertEqual(Comic.absoluteURL(filter: ResourceFilter(.Events, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/events/42/comics")
        XCTAssertEqual(Comic.absoluteURL(filter: ResourceFilter(.Stories, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/stories/42/comics")
    }
    
}
