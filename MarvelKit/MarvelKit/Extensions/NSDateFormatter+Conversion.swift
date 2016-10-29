//
//  NSDateFormatter+Conversion.swift
//  MarvelKit
//
//  Created by Carsten Könemann on 15.05.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import Foundation

extension DateFormatter {

    static var marvelDateFormatter: DateFormatter {

        let dateFormatter = DateFormatter()

        dateFormatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent

        return dateFormatter
    }

}

extension Date {

    var string: String {
        return DateFormatter.marvelDateFormatter.string(from: self)
    }

}

extension String {

    var date: Date? {
        return DateFormatter.marvelDateFormatter.date(from: self)
    }
    
}
