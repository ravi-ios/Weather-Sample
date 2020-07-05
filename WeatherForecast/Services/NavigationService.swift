//
//  NavigationService.swift
//  WeatherForecast
//
//  Created by Ravikumar Chintakayala on 05/07/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import UIKit

class NavigationService {
    
    static let shared = NavigationService()
    
    private let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    private var topPresentedViewController: UIViewController? {
        guard var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController else {
            return nil
        }

        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        
        if let rootVC = (topController as? UINavigationController)?.viewControllers.first {
            topController = rootVC
        }
        return topController
    }
    
    private init() { }
    
    public func showAlert(title: String = "Alert", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        topPresentedViewController?.present(alert, animated: true)
    }
    
}
