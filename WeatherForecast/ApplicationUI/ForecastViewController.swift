//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    // MARK: - Private Members
    
    private let forecastService = ForecastService()
    
    private var userLocation: CLLocation? {
        didSet {
            guard let userLocation = userLocation else { return }
            LocationService.shared.getAddress(userLocation) { self.cityLabel.text = $0 }
        }
    }
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestAlwaysAuthorization()
        return locationManager
    }()
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLocationService()
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var collectionView: HourlyForecastCollectionView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    // MARK: - IBActions
    
    @IBAction func refreshButtonTouchUpInside(_ sender: UIButton) {
        guard let userLocation = userLocation else { return }
        
        loadWeatherData(userLocation)
    }
    
    // MARK: - Private Methods
    
    private func configureLocationService() {
        locationManager.startUpdatingLocation()
        
        guard CLLocationManager.locationServicesEnabled() else {
            NavigationService.shared.showAlert(message: "Location services not enabled")
            return
        }
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined, .restricted, .denied:
            NavigationService.shared.showAlert(message: "Please allow access to location services in settings")
        default: break
        }
    }
    
    private func loadWeatherData(_ location: CLLocation) {
        refreshButton.isEnabled = false
        forecastService.getForecastData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { [weak self] result, error in
            guard let self = self else { return }
            
            defer { self.refreshButton.isEnabled = true }
            
            guard error == nil else {
                NavigationService.shared.showAlert(message: error?.localizedDescription ?? "Sorry, some thing went wrong")
                return
            }
            
            guard let result = result else { return }
            
            self.updateUI(result)
        }
    }
    
    private func updateUI(_ weatherData: Forecast) {
        
        collectionView.weather = weatherData.hourly?.data
        
        let _ = stackView.subviews.compactMap {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        if let oneWeekWeather = weatherData.daily?.data {
            oneWeekWeather.forEach{ stackView.addArrangedSubview(WeeklyForecastView.instantiate($0)) }
        }
        
        guard let currentWeather = weatherData.currently else { return }
        
        self.summaryLabel.text = currentWeather.summary
        self.temperatureLabel.text = currentWeather.temperature?.roundedString.celsiusString
        
        if currentWeather.sunriseTime != nil || currentWeather.sunsetTime != nil {
            let sunriseTime = currentWeather.sunriseTime?.toDate.getTime() ?? "-"
            let sunsetTime = currentWeather.sunsetTime?.toDate.getTime() ?? "-"
            let view = DailyForecastStackView.instantiate(leftTitle: "SUNRISE", leftValu: "\(sunriseTime)", rightTitle: "SUNSET", rightValu: "\(sunsetTime)")
            
            stackView.addArrangedSubview(view)
        }
        
        if currentWeather.apparentTemperature != nil || currentWeather.humidity != nil {
            let apparentTemperature = currentWeather.apparentTemperature?.roundedString.celsiusString ?? "-"
            let humidity = currentWeather.humidity == nil ? "-" : (currentWeather.humidity! * 100).roundedString + " %"
            let view = DailyForecastStackView.instantiate(leftTitle: "FEELS LIKE", leftValu: "\(apparentTemperature)", rightTitle: "HUMIDITY", rightValu: "\(humidity)")
            
            stackView.addArrangedSubview(view)
        }
        
        if currentWeather.windSpeed != nil || currentWeather.pressure != nil {
            let windSpeed = currentWeather.windSpeed == nil ? "-" : "\(currentWeather.windSpeed!) mps"
            let pressure = currentWeather.pressure == nil ? "-" : "\(currentWeather.pressure!) hPa"
            let view = DailyForecastStackView.instantiate(leftTitle: "WIND", leftValu: "\(windSpeed)", rightTitle: "PRESSURE", rightValu: "\(pressure)")
            
            stackView.addArrangedSubview(view)
        }
        
        if currentWeather.visibility != nil || currentWeather.uvIndex != nil {
            let visibility = currentWeather.visibility == nil ? "-" : "\(currentWeather.visibility!) km"
            let uvIndex = currentWeather.uvIndex == nil ? "-" : "\(currentWeather.uvIndex!)"
            let view = DailyForecastStackView.instantiate(leftTitle: "VISIBILITY", leftValu: "\(visibility) ", rightTitle: "UV INDEX", rightValu: "\(uvIndex)")
            
            stackView.addArrangedSubview(view)
        }
        
    }
    
}

// MARK: - LocationManagerDelegate

extension ForecastViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        userLocation = location
        
        loadWeatherData(location)
    }
    
}
