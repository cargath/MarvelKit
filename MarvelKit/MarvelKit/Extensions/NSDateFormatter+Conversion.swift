//
//  NSDateFormatter+Conversion.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

extension NSDateFormatter {

    static var marvelDateFormatter: NSDateFormatter {

        let dateFormatter = NSDateFormatter()

        dateFormatter.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.timeZone = NSTimeZone.localTimeZone()

        return dateFormatter
    }

}

extension NSDate {

    var string: String {
        return NSDateFormatter.marvelDateFormatter.stringFromDate(self)
    }

}

extension String {

    var date: NSDate? {
        return NSDateFormatter.marvelDateFormatter.dateFromString(self)
    }
    
}
