//
//  DailyForecastStackView.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class DailyForecastStackView: UIView {
    
    // MARK: - Initialization & Memory Management

    class func instantiate(leftTitle: String, leftValu: String, rightTitle: String, rightValu: String) -> DailyForecastStackView {
        let view = UINib(nibName: "\(DailyForecastStackView.self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as! DailyForecastStackView
        view.leftView.configure(title: leftTitle, value: leftValu)
        view.rightView.configure(title: rightTitle, value: rightValu)
        return view
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var leftView: DailyForecastView!
    @IBOutlet weak var rightView: DailyForecastView!

}
