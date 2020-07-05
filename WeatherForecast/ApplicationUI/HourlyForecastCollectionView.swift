//
//  HourlyForecastCollectionView.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class HourlyForecastCollectionView: UICollectionView {
    
    // MARK: - CollectionView Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource = self
        dataSource = self
    }
    
    // MARK: - Internal properties
    
    var weather: [Datum]? {
        didSet { reloadData() }
    }
    
}

// MARK: - CollectionViewDataSource

extension HourlyForecastCollectionView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HourlyForecastCollectionViewCell.self)", for: indexPath) as! HourlyForecastCollectionViewCell
        cell.data = weather?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather?.count ?? 0
    }
    
}


