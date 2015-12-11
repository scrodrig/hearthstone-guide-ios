//
//  SearchByClassClientTest.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 11/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import XCTest

class SearchByClassClientTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSearchByClass() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = expectationWithDescription("going to fetch info")
        //static func searchInfo(completionHandler: (Info?, NSError?) -> Void) -> Void {
        SearchByClassClient.searchCardsByClass(Heroes.Paladin, location: Location.USAEnglish) { (cards, error) -> Void in
            XCTAssertNotNil(cards);
            XCTAssertNil(error);
            expectation.fulfill();
        }
       
        waitForExpectationsWithTimeout(100) {(error) -> Void in
            XCTAssertNil(error);
        }
   
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
