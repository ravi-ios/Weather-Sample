//
//  CacheTests.swift
//  WeatherForecastTests
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import XCTest
@testable import WeatherForecast

class CacheTests: XCTestCase {
    
    private var cache: Cache<String, String>!

    override func setUpWithError() throws {
        cache = Cache<String, String>()
    }

    override func tearDownWithError() throws {

    }

    func testDeleteValue()  throws {
        let key = "test-key"
        let value = "test-value"
        
        cache.insert(value, forKey: key)
        XCTAssertTrue(cache[key] == value, "Before deletion: \(value) must be in cache")

        cache.removeValue(forKey: key)
        XCTAssertNil(cache[key], "After deletion: \(value) must delete from cache")
    }
    
    func testInsertValue()  throws {
        let key = "test-key"
        let value = "test-value"
        
        XCTAssertNil(cache[key], "Before insertion: Should not have the value for key: \(key) ")
                
        cache.insert(value, forKey: key)
        XCTAssertTrue(cache[key] == value, "After insertion: \(value) must be store in cache")
    }
    
    func testRetrieveValue()  throws {
        let key = "test-key"
        let value = "test-value"
        
        cache[key] = value
        XCTAssertTrue(cache.value(forKey: key) == value, "Stored value must be \(value)")
    }
    
    func testUpdateValue()  throws {
        let key = "test-key"
        let value = "test-value"
        let updatedValue = "test-value-updated"
        
        cache[key] = value
        XCTAssertTrue(cache[key] == value, "Before update: Stored value must be \(value)")
        
        cache[key] = updatedValue
        XCTAssertTrue(cache[key] == updatedValue, "After update: \(value) must be replaced with \(updatedValue)")
    }

}
