//
//  Double.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

extension Double {
    
    var roundedString: String {
        return String(format: "%.0f", self)
    }
}
