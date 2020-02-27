//
//  DistanceCalculatorClass.swift
//  AreYouInvited?
//
//  Created by Insight on 2/27/20.
//  Copyright © 2020 Insight. All rights reserved.
//

import Foundation

class DistanceCalculatorClass {
    let earthRadius = 6371

    static let sharedInstance = DistanceCalculatorClass()
    
    private init () {
        
    }
    
    func calculateCustomerDistance(customerLatitude:Double,customerLongitude:Double,destinationLatitude:Double,destinationLongitude:Double) -> Double {
       let customerLatitudeRadians = ((customerLatitude * (Double.pi)/180))
       let customerLongitudeRadians = ((customerLongitude * (Double.pi)/180))
       let destinationLatitudeRadians = ((destinationLatitude * (Double.pi)/180))
       let destinationLongitudeRadians = ((destinationLongitude * (Double.pi)/180))

        let angle  = acos((sin(customerLatitudeRadians) * sin(destinationLatitudeRadians)) + (  cos(customerLatitudeRadians) * cos(destinationLatitudeRadians) * cos(customerLongitudeRadians-destinationLongitudeRadians)))
        let distance = Double(earthRadius) * angle
        return distance
    }
}
