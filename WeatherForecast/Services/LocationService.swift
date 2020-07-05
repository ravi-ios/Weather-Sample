//
//  LocationService.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService {
    
    static let shared = LocationService()
    
    private let cache = Cache<String, String>()
    
    private init() { }
    
    func getAddress(_ location: CLLocation, completionHandler: @escaping (String?) -> Void) {
        let key = "\(location.coordinate.latitude)-\(location.coordinate.longitude)"
        
        if let cached = cache[key] {
            DispatchQueue.main.async { completionHandler(cached) }
            return
        }
    
        CLGeocoder().reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self,
                let placemarks = placemarks,
                let placemark = placemarks.first, error == nil else { return completionHandler(nil) }
            
            self.cache[key] = placemark.locality

            DispatchQueue.main.async { completionHandler(placemark.locality) }
        }
    }
    
}
