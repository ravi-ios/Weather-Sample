//
//  WeatherAlert.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct WeatherAlert: Decodable {
    
    let description: String
    
    let expires: Int
    
    let regions: [String]

    let severity: String
    
    let time: Int

    let title: String
    
    let uri: String

}
