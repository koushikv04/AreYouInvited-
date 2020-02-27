//
//  ViewController.swift
//  AreYouInvited?
//
//  Created by Insight on 2/27/20.
//  Copyright © 2020 Insight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let intercomLatitude = 53.339428
    let intercomLongitude = -6.257664

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filePath = Bundle.main.path(forResource: "customers", ofType: "txt")!
        let fileManager = FileManager.sharedInstance
        if let customers = fileManager.readJSONFile(from: URL(fileURLWithPath: filePath)) {
            let distanceClass = DistanceCalculatorClass.sharedInstance
            var invitessArray = [Customer]()

            for customer in customers {
                let distance = distanceClass.calculateCustomerDistance(customerLatitude: Double(customer.latitude)!, customerLongitude: Double(customer.longitude)!, destinationLatitude: intercomLatitude, destinationLongitude: intercomLongitude)
                if (distance<100) {
                    invitessArray.append(customer)
                }
            }
            invitessArray.sort(by: {c1,c2 in  c1.user_id < c2.user_id})
            print("Customers are :\n")
            for invitee in invitessArray {
                print("UserID:\(invitee.user_id), Name:\(invitee.name)")
            }
        }
    }


}

