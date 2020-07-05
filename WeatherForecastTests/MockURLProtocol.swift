//
//  MockURLProtocol.swift
//  WeatherForecastTests
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var response: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let error = MockURLProtocol.error else {
           client?.urlProtocol(self, didLoad: MockURLProtocol.response ?? Data())
           client?.urlProtocolDidFinishLoading(self)
            return
        }

        client?.urlProtocol(self, didFailWithError: error)
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
    
}
