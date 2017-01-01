//
//  AuthenticationTests.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 16.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

@testable import MarvelKit

import XCTest

class AuthenticationTests: XCTestCase {

    func testMDH5() {
        XCTAssertEqual("1abcd1234".md5, "ffd275c5130566a2916217b101f26150")
    }

    func testAccount() {
        XCTAssertEqual(Account(privateKey: "abcd", publicKey: "1234").hash(timestamp: "1"), "ffd275c5130566a2916217b101f26150")
    }

    func testMarvelKit() {
        XCTAssertEqual(MarvelKitClient(privateKey: "abcd", publicKey: "1234").account.hash(timestamp: "1"), "ffd275c5130566a2916217b101f26150")
    }

}
