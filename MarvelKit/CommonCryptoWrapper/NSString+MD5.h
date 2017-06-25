//
//  NSString+MD5.h
//  MarvelKit
//
//  Created by Carsten Könemann on 25.06.2017.
//  Copyright © 2017 cargath. All rights reserved.
//

@import Foundation;

@interface NSString (MD5)

/**
    Returns the MD5 hash of this string.
 
    Note that this specifically returns the lowercase version,
    because the Marvel API doesn't accept the uppercase one from CommonCrypto.
 */
@property (nonatomic, readonly) NSString *md5;

@end
