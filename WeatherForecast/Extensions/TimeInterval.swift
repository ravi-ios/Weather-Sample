//
//  TimeInterval.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    var toDate: Date {
        return Date(timeIntervalSince1970: self)
    }
    
}
