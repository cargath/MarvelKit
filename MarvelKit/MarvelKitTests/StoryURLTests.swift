//
//  StoryURLTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class StoryURLTests: XCTestCase {

    func testRequestURL() {
        XCTAssertEqual(Story.absoluteURL()?.absoluteString, "https://gateway.marvel.com/v1/public/stories")
    }

    func testRequestURLWithID() {
        XCTAssertEqual(Story.absoluteURL(id: 42)?.absoluteString, "https://gateway.marvel.com/v1/public/stories/42")
    }

    func testRequestURLWithFilter() {
        XCTAssertEqual(Story.absoluteURL(filter: ResourceFilter(.Characters, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/characters/42/stories")
        XCTAssertEqual(Story.absoluteURL(filter: ResourceFilter(.Comics, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/comics/42/stories")
        XCTAssertEqual(Story.absoluteURL(filter: ResourceFilter(.Creators, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/creators/42/stories")
        XCTAssertEqual(Story.absoluteURL(filter: ResourceFilter(.Events, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/events/42/stories")
        XCTAssertEqual(Story.absoluteURL(filter: ResourceFilter(.Series, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/series/42/stories")
    }

}
