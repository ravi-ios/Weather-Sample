//
//  Flags.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct Flags: Decodable {
    
    let darkskyUnavailable: Bool?

    let nearestStation: Double
    
    let sources: [String]
    
    let units: String

    let meteoalarmLicense: String?
    
    enum CodingKeys: String, CodingKey {
        
        case sources
        
        case meteoalarmLicense = "meteoalarm-license"
        
        case nearestStation = "nearest-station"
        
        case darkskyUnavailable = "darksky-unavailable"
        
        case units
    }
}

