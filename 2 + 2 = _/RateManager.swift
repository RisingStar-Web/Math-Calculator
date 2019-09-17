//
//  RateManager.swift
//  2 + 2 = ?
//
//  Created by Mac on 18.09.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit
import StoreKit

@available(iOS 10.3, *)

class RateManager {
    
    class func incrementCount() {
//        let userDefaults = UserDefaults.standard
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count < 12 {
            UserDefaults.standard.set(count + 1, forKey: "run_count")
            UserDefaults.standard.synchronize()
        }
    }
    
    class func showRatesController() {
    
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count == 12 {
            UserDefaults.standard.set(17, forKey: "run_count")
            UserDefaults.standard.set(true, forKey: "i_see_rate_manager")
            UserDefaults.standard.synchronize()
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {  // тут реализована задержка AC
                SKStoreReviewController.requestReview()
            })
        }
    }
    
    class func showRatesControllerNow() {
                SKStoreReviewController.requestReview()
    }
}
