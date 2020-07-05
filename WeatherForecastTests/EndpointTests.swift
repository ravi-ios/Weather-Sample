//
//  EndpointTests.swift
//  WeatherForecastTests
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import XCTest
@testable import WeatherForecast

class EndpointTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testForecastEndpointUrl() throws {
        let latitude = 19.0176147
        let longitude = 72.8561644
        let expectedUrlString = "https://api.darksky.net/forecast/2bb07c3bece89caf533ac9a5d23d8417/\(latitude),%20\(longitude)?units=si"
                
        let endpoint = Endpoint.forecast(latitude: latitude, longitude: longitude)
        
        XCTAssertTrue(endpoint.url!.absoluteString == expectedUrlString, "Constructed url must be \(expectedUrlString)")
    }

}
