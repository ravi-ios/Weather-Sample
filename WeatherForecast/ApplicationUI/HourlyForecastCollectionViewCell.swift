//
//  HourlyForecastCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var temperatureLabel : UILabel!
    @IBOutlet weak var timeLabel        : UILabel!
    
    // MARK: - Internal properties
    
    var data : Datum? {
        didSet {
            timeLabel.text = data?.time.toDate.getTime("HH a")
            temperatureLabel.text = data?.temperature?.roundedString.celsiusString ?? "-"
        }
    }
        
}
