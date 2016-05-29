//
//  SeriesURLTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class SeriesURLTests: XCTestCase {

    func testRequestURL() {
        XCTAssertEqual(Series.absoluteURL()?.absoluteString, "https://gateway.marvel.com/v1/public/series")
    }

    func testRequestURLWithID() {
        XCTAssertEqual(Series.absoluteURL(id: 42)?.absoluteString, "https://gateway.marvel.com/v1/public/series/42")
    }

    func testRequestURLWithFilter() {
        XCTAssertEqual(Series.absoluteURL(filter: ResourceFilter(.Characters, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/characters/42/series")
        XCTAssertEqual(Series.absoluteURL(filter: ResourceFilter(.Comics, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/comics/42/series")
        XCTAssertEqual(Series.absoluteURL(filter: ResourceFilter(.Creators, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/creators/42/series")
        XCTAssertEqual(Series.absoluteURL(filter: ResourceFilter(.Events, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/events/42/series")
        XCTAssertEqual(Series.absoluteURL(filter: ResourceFilter(.Stories, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/stories/42/series")
    }

}
