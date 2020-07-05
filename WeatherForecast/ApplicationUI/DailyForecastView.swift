//
//  DailyForecastView.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

@IBDesignable
class DailyForecastView: UIView {
    
    // MARK: - Private Members

    private var contentView: UIView?

    // MARK: - View Lifecycle

    public override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Public Methods
    
    public func configure(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
    
    // MARK: - Private Methods
    
    private func loadViewFromNib() -> UIView {
        return UINib(nibName: "\(DailyForecastView.self)", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    private func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView = view
        addSubview(view)
    }
    
}
