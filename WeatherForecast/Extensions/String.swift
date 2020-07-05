//
//  String.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

extension String {
    
    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = Locale.autoupdatingCurrent
        dateFormatter.calendar = Calendar.autoupdatingCurrent
        
        return dateFormatter.date(from: self)
    }
    
    var celsiusString: String {
        return self + "\u{00B0}" + "c"
    }
}
