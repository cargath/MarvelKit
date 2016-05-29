//
//  CreatorURLTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class CreatorURLTests: XCTestCase {

    func testRequestURL() {
        XCTAssertEqual(Creator.absoluteURL()?.absoluteString, "https://gateway.marvel.com/v1/public/creators")
    }

    func testRequestURLWithID() {
        XCTAssertEqual(Creator.absoluteURL(id: 42)?.absoluteString, "https://gateway.marvel.com/v1/public/creators/42")
    }

    func testRequestURLWithFilter() {
        XCTAssertEqual(Creator.absoluteURL(filter: ResourceFilter(.Comics, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/comics/42/creators")
        XCTAssertEqual(Creator.absoluteURL(filter: ResourceFilter(.Events, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/events/42/creators")
        XCTAssertEqual(Creator.absoluteURL(filter: ResourceFilter(.Series, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/series/42/creators")
        XCTAssertEqual(Creator.absoluteURL(filter: ResourceFilter(.Stories, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/stories/42/creators")
    }

}
