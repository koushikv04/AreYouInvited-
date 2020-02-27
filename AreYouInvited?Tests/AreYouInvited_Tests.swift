//
//  AreYouInvited_Tests.swift
//  AreYouInvited?Tests
//
//  Created by Insight on 2/27/20.
//  Copyright © 2020 Insight. All rights reserved.
//

import XCTest
@testable import AreYouInvited_

class AreYouInvited_Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFileContents() {
        let fileManager = FileManager.sharedInstance
        let filePath = Bundle.main.path(forResource: "customers", ofType: "txt")!
        if let customers = fileManager.readJSONFile(from: URL(fileURLWithPath: filePath)) {
            let randomNumber = Int.random(in: 1..<customers.count)
            XCTAssertNotNil(customers[randomNumber].latitude, "latitude should not be nil")
            XCTAssertNotNil(customers[randomNumber].longitude, "longitude should not be nil")
        }
        else {
            XCTFail()
        }
    }
    
    func testCalculateDistance(){
        let distanceClass = DistanceCalculatorClass.sharedInstance
        let distance = distanceClass.calculateCustomerDistance(customerLatitude: 53.2451022, customerLongitude: -6.238335, destinationLatitude: 53.339428, destinationLongitude: -6.257664)
        XCTAssertEqual(Int(distance), 10,"This should be 10")
    }
    
    

}
