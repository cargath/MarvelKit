//
//  CharacterURLTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 29.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class CharacterURLTests: XCTestCase {

    func testRequestURL() {
        XCTAssertEqual(Character.absoluteURL()?.absoluteString, "https://gateway.marvel.com/v1/public/characters")
    }

    func testRequestURLWithID() {
        XCTAssertEqual(Character.absoluteURL(id: 42)?.absoluteString, "https://gateway.marvel.com/v1/public/characters/42")
    }

    func testRequestURLWithFilter() {
        XCTAssertEqual(Character.absoluteURL(filter: ResourceFilter(.Comics, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/comics/42/characters")
        XCTAssertEqual(Character.absoluteURL(filter: ResourceFilter(.Events, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/events/42/characters")
        XCTAssertEqual(Character.absoluteURL(filter: ResourceFilter(.Series, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/series/42/characters")
        XCTAssertEqual(Character.absoluteURL(filter: ResourceFilter(.Stories, id: 42))?.absoluteString, "https://gateway.marvel.com/v1/public/stories/42/characters")
    }

}
