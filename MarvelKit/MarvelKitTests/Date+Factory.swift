//
//  Date+Factory.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 25.06.2017.
//  Copyright © 2017 cargath. All rights reserved.
//

import Foundation

extension Date {
    
    static func with(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, timeZoneOffset: Int) -> Date {
        
        var gregorian = Calendar(identifier: .gregorian)
        gregorian.timeZone = TimeZone(secondsFromGMT: timeZoneOffset)!
        
        var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date(timeIntervalSince1970: 0))
        
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        return gregorian.date(from: components)!
    }
    
}
