//
//  Datum.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct Datum: Decodable {
    
    let apparentTemperature: Double?
    
    let apparentTemperatureHigh: Double?
    
    let apparentTemperatureHighTime: Int?
    
    let apparentTemperatureLow: Double?
    
    let apparentTemperatureLowTime: Int?
    
    let apparentTemperatureMax: Double?
    
    let apparentTemperatureMaxTime: Int?

    let apparentTemperatureMin: Double?
    
    let apparentTemperatureMinTime: Int?
    
    let cloudCover: Double?
    
    let dewPoint: Double?
       
    let humidity: Double?
    
    let icon: Icon?
    
    let moonPhase: Double?
    
    let nearestStormBearing: Double?
    
    let nearestStormDistance: Double?
    
    let ozone: Double?
    
    let precipAccumulation: Double?
    
    let precipIntensity: Double?
    
    let precipIntensityError: Double?
        
    let precipIntensityMax: Double?

    let precipIntensityMaxTime: Int?
    
    let precipProbability: Double?
    
    let precipType: PrecipType?
    
    let pressure: Double?
    
    let summary: String?
    
    let sunriseTime: TimeInterval?
    
    let sunsetTime: TimeInterval?
    
    let temperature: Double?
    
    let temperatureHigh: Double?
    
    let temperatureHighTime: Int?
    
    let temperatureLow: Double?
    
    let temperatureLowTime: Int?
    
    let temperatureMax: Double?
    
    let temperatureMaxTime: Int?
    
    let temperatureMin: Double?

    let temperatureMinTime: TimeInterval?

    let time: TimeInterval
    
    let uvIndex: Int?
    
    let uvIndexTime: TimeInterval?
    
    let visibility : Double?
    
    let windBearing: Int?
    
    let windGust: Double?

    let windGustTime: TimeInterval?

    let windSpeed: Double?
    
}
