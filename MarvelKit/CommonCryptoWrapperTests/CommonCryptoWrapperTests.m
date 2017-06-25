//
//  CommonCryptoWrapperTests.m
//  CommonCryptoWrapperTests
//
//  Created by Carsten Könemann on 25.06.2017.
//  Copyright © 2017 cargath. All rights reserved.
//

@import XCTest;

#import "NSString+MD5.h"

@interface CommonCryptoWrapperTests : XCTestCase

@end

@implementation CommonCryptoWrapperTests

- (void)testMD5 {
    XCTAssertTrue([@"1abcd1234".md5 isEqualToString:@"ffd275c5130566a2916217b101f26150"]);
}

@end
