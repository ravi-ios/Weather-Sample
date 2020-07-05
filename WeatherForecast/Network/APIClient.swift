//
//  APIClient.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

class APIClient {
    
    static let shared = APIClient()
        
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }
    
    func get<T: Decodable>(_ url: URL?, completionHandler: @escaping (T?, Error?) -> Void) {
        guard let url = url else {
            let error = NSError(domain: "com.service", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid url"]) as Error
            completionHandler(nil, error)
            return
        }
        
        urlSession.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async { completionHandler(nil, error) }
                return
            }
            
            do {
                let paesedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async { completionHandler(paesedData, nil) }
            } catch {
               DispatchQueue.main.async { completionHandler(nil, error) }
            }
        }.resume()
    }

}
