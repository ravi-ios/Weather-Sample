//
//  Endpoint.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
    static let token = "2bb07c3bece89caf533ac9a5d23d8417"
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.darksky.net"
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}

extension Endpoint {

    static func forecast(latitude: Double, longitude: Double) -> Endpoint {
        return Endpoint(
            path: "/forecast/\(Endpoint.token)/\(latitude), \(longitude)",
            queryItems: [
                URLQueryItem(name: "units", value: "si"),
            ]
        )
    }

}
