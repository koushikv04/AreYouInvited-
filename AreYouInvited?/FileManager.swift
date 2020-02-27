//
//  FileManager.swift
//  AreYouInvited?
//
//  Created by Insight on 2/27/20.
//  Copyright © 2020 Insight. All rights reserved.
//

import Foundation

class FileManager {
    
    static let sharedInstance = FileManager()
    
    private init() {
        
    }
    
    func readJSONFile(from url:URL)->[Customer]? {
        var customers=[Customer]()
        if let inviteesString = try? String(contentsOf: url) {
            let strSeperated = inviteesString.components(separatedBy: "\n")
            let decoder = JSONDecoder()
            for customerObject in strSeperated {
                if let customer = try? decoder.decode(Customer.self, from: customerObject.data(using: .utf8)!) {
                    customers.append(customer)
                }
            }
            return customers
        }
           return nil
    }
}
