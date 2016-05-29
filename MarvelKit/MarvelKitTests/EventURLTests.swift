//
//  EventURLTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class EventURLTests: XCTestCase {

    func testRequestURL() {
        XCTAssertEqual(Event.absoluteURL()?.absoluteString, "https://gateway.marvel.com/v1/public/events")
    }

    func testRequestURLWithID() {
        XCTAssertEqual(Event.absoluteURL(id: 42)?.absoluteString, "https://gateway.marvel.com/v1/public/events/42")
    }

    func testRequestURLWithFilter() {
        XCTAssertEqual(Event.absoluteURL(filter: ResourceFilter(.Characters, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/characters/42/events")
        XCTAssertEqual(Event.absoluteURL(filter: ResourceFilter(.Comics, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/comics/42/events")
        XCTAssertEqual(Event.absoluteURL(filter: ResourceFilter(.Creators, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/creators/42/events")
        XCTAssertEqual(Event.absoluteURL(filter: ResourceFilter(.Series, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/series/42/events")
        XCTAssertEqual(Event.absoluteURL(filter: ResourceFilter(.Stories, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/stories/42/events")
    }

}
