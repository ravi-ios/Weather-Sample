//
//  ForecastService.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let apiClient: APIClient

    init(apiClient: APIClient = .shared ) {
        self.apiClient = apiClient
    }
    
    func getForecastData(latitude: Double, longitude: Double, completionHandler: @escaping (Forecast?, Error?) -> Void) {
        let url = Endpoint.forecast(latitude: latitude, longitude: longitude).url
        
        apiClient.get(url, completionHandler: completionHandler)
    }
    
}
