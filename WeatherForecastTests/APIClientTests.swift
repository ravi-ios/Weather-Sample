//
//  APIClientTests.swift
//  WeatherForecastTests
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import XCTest
@testable import WeatherForecast

class APIClientTests: XCTestCase {
    
    private var apiClient: APIClient!
    
    var testData: Data {
        return try! Data(contentsOf: Bundle.main.url(forResource: "TestForecast", withExtension: "json")!)
    }

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        apiClient = APIClient(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
    
    }
    
    func testSessionTaskFailure() throws {
        let url = URL(string: "https://test.com")
        let errorDescription = "Test error description"
        
        MockURLProtocol.response = nil
        MockURLProtocol.error = NSError(domain: "com.service", code: 400, userInfo: [NSLocalizedDescriptionKey: errorDescription]) as Error
        
        let expectation = XCTestExpectation(description: "Error response")
        
        apiClient.get(url) { (result: Data?, error) in
            XCTAssertEqual(result, nil)
            XCTAssertEqual(error?.localizedDescription, errorDescription)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testSessionTaskResponse() throws {
        let url = URL(string: "https://test-response.com")
        let latitude = 19.0176147  // From Json file
        let longitude = 72.8561644
        let timezone = "Asia/Kolkata"
        let temperature = 29.86
        let summary = "Rain and Humid"
                
        MockURLProtocol.response = Data(testData)
        MockURLProtocol.error = nil

        let expectation = XCTestExpectation(description: "response")
        
        apiClient.get(url) { (result: Forecast?, error) in
            XCTAssertEqual(error?.localizedDescription, nil)
            XCTAssertEqual(result?.latitude, latitude)
            XCTAssertEqual(result?.longitude, longitude)
            XCTAssertEqual(result?.timezone, timezone)
            XCTAssertEqual(result?.currently?.temperature, temperature)
            XCTAssertEqual(result?.currently?.summary, summary)
            XCTAssertEqual(result?.daily?.data.count, 2)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

}
