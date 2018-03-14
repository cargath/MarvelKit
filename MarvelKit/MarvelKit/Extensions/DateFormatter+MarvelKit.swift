//
//  DateFormatter+MarvelKit.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

extension String {

    static var iso8601DateFormat: String {
        return "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    }
    
    static var eventDateFormat: String {
        return "yyyy-MM-dd HH:mm:ss"
    }

    static var simpleDateFormat: String {
        return "yyyy-MM-dd"
    }

}

extension DateFormatter {

    static var iso8601Formatter: DateFormatter {

        let iso8601Formatter = DateFormatter()

        iso8601Formatter.calendar = Calendar(identifier: .iso8601)
        iso8601Formatter.dateFormat = .iso8601DateFormat
        iso8601Formatter.locale = Locale(identifier: "en_US_POSIX")
        iso8601Formatter.timeZone = TimeZone(secondsFromGMT: 0)

        return iso8601Formatter
    }
    
    static var eventDateFormatter: DateFormatter {
        
        let eventDateFormatter = DateFormatter()
        
        eventDateFormatter.calendar = Calendar(identifier: .gregorian)
        eventDateFormatter.dateFormat = .eventDateFormat
        eventDateFormatter.locale = .current
        eventDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return eventDateFormatter
    }

    static var simpleDateFormatter: DateFormatter {

        let simpleDateFormatter = DateFormatter()

        simpleDateFormatter.calendar = Calendar(identifier: .gregorian)
        simpleDateFormatter.dateFormat = .simpleDateFormat
        simpleDateFormatter.locale = .current
        simpleDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        return simpleDateFormatter
    }

}

extension Date {

    var iso8601String: String {
        return DateFormatter.iso8601Formatter.string(from: self)
    }
    
    var eventString: String {
        return DateFormatter.eventDateFormatter.string(from: self)
    }

    var string: String {
        return DateFormatter.simpleDateFormatter.string(from: self)
    }

}

extension String {

    var iso8601Date: Date? {
        return DateFormatter.iso8601Formatter.date(from: self)
    }
    
    var eventDate: Date? {
        return DateFormatter.eventDateFormatter.date(from: self)
    }

    var date: Date? {
        return DateFormatter.simpleDateFormatter.date(from: self)
    }
    
}
