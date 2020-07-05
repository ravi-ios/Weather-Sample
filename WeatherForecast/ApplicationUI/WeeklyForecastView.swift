//
//  WeeklyForecastView.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class WeeklyForecastView: UIView {
    
    // MARK: - Initialization & Memory Management
    
    class func instantiate(_ data: Datum) -> WeeklyForecastView {
        let view = UINib(nibName: "\(WeeklyForecastView.self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as! WeeklyForecastView
        view.data = data
        return view
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    @IBOutlet weak var weekNameLabel: UILabel!
    
    // MARK: - Private properties
    
    private var data: Datum! {
        didSet {
            weekNameLabel.text = Date(timeIntervalSince1970: data.time).getDayInWeek()
            maximumTemperatureLabel.text = data.temperatureMax != nil ? data.temperatureMax!.roundedString : "-"
            minimumTemperatureLabel.text = data.temperatureMin != nil ? data.temperatureMin!.roundedString : "-"
        }
    }

}
