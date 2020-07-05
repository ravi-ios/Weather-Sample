//
//  MinutelyForecast.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct MinutelyForecast: Decodable {

    let summary: String?
    
    let icon: Icon?
    
    let data: [Datum]?

}
