//
//  Forecast.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

enum Icon: String, Decodable {
    
    case clearDay = "clear-day"
    
    case clearNight = "clear-night"
    
    case cloudy = "cloudy"
    
    case fog = "fog"
    
    case hail = "hail"
    
    case partlyCloudyDay = "partly-cloudy-day"
    
    case partlyCloudyNight = "partly-cloudy-night"
    
    case thunderstorm = "thunderstorm"
    
    case tornado = "tornado"
    
    case rain = "rain"
    
    case snow = "snow"
    
    case sleet = "sleet"
    
    case wind = "wind"
    
}

enum PrecipType: String, Decodable {
    
    case rain
    
    case snow
    
    case sleet
}

struct Forecast: Decodable {
        
    let latitude: Double
    
    let longitude: Double
    
    let timezone: String
    
    let currently: Datum?
    
    let minutely: MinutelyForecast?
    
    let hourly: HourlyForecast?
    
    let daily: DailyForecast?
    
    let alerts: [WeatherAlert]?
    
    let flags: Flags?

}
