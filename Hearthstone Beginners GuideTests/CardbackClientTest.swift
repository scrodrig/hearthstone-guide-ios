//
//  CardbackTest.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 08/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import XCTest

class CardbackClientTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testParseCardBack() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let responseString = "[{\"cardBackId\":\"0\",\"name\":\"Classic\",\"description\":\"The only card back you2019ll ever need.\",\"source\":\"startup\",\"sourceDescription\":\"Default\",\"enabled\":true,\"img\":\"http://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Default.png\",\"imgAnimated\":\"http://wow.zamimg.com/images/hearthstone/backs/animated/Card_Back_Default.gif\",\"sortCategory\":\"1\",\"sortOrder\":\"1\",\"locale\":\"enUS\"},{\"cardBackId\":\"1\",\"name\":\"Pandaria\",\"description\":\"Hearthstone is a very popular game in Pandaria.  Official card game of the Shado-Pan!\",\"source\":\"season\",\"sourceDescription\":\"Season\",\"howToGet\":\"Acquired from achieving Rank 20 in Ranked Play, April 2014.\",\"enabled\":true,\"img\":\"http://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Pandaria.png\",\"imgAnimated\":\"http://wow.zamimg.com/images/hearthstone/backs/animated/Card_Back_Pandaria.gif\",\"sortCategory\":\"5\",\"sortOrder\":\"0\",\"locale\":\"enUS\"},{\"cardBackId\":\"2\",\"name\":\"Black Temple\",\"description\":\"el Flame Greend is always in fashion at the Black Temple.\",\"source\":\"season\",\"sourceDescription\":\"Season\",\"howToGet\":\"Acquired from achieving Rank 20 in Ranked Play, May 2014.\",\"enabled\":true,\"img\":\"http://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_BlackTemple.png\",\"imgAnimated\":\"http://wow.zamimg.com/images/hearthstone/backs/animated/Card_Back_BlackTemple.gif\",\"sortCategory\":\"5\",\"sortOrder\":\"0\",\"locale\":\"enUS\"},{\"cardBackId\":\"3\",\"name\":\"Rainbow!\",\"description\":\"Unfortunately, the rainbow generator can only produce oval rainbows.  Gnomish technology still has a ways to go.\",\"source\":\"season\",\"sourceDescription\":\"Season\",\"howToGet\":\"Acquired from achieving Rank 20 in Ranked Play, June 2014.\",\"enabled\":true,\"img\":\"http://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Charm.png\",\"imgAnimated\":\"http://wow.zamimg.com/images/hearthstone/backs/animated/Card_Back_Charm.gif\",\"sortCategory\":\"5\",\"sortOrder\":\"0\",\"locale\":\"enUS\"},{\"cardBackId\":\"4\",\"name\":\"Fireside\",\"description\":\"A generous gift from the Innkeeper.  He loves to see his guests having a good time together.\",\"source\":\"achieve\",\"sourceDescription\":\"Special\",\"howToGet\":\"Play three matches against players on the same local network as you. (Must have at least 3 players on that network!)\",\"enabled\":true,\"img\":\"http://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Launch.png\",\"imgAnimated\":\"http://wow.zamimg.com/images/hearthstone/backs/animated/Card_Back_Launch.gif\",\"sortCategory\":\"2\",\"sortOrder\":\"1\",\"locale\":\"enUS\"}]";
        XCTAssertNil(InfoClient.parseInfo(nil));
        
        let data = responseString.dataUsingEncoding(NSUTF8StringEncoding);
        let info = CardbackClient.parseCardbacks(data);
        
        print(info);
        
    }
    
    
    func testSearchInfo(){
        let expectation = expectationWithDescription("going to fetch info")
        //static func searchInfo(completionHandler: (Info?, NSError?) -> Void) -> Void {
        CardbackClient.searchCardbacks(Location.USAEnglish.rawValue) { (info, error) -> Void in
            XCTAssertNotNil(info);
            XCTAssertNil(error);
            expectation.fulfill();
        }
        
        waitForExpectationsWithTimeout(10) {(error) -> Void in
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
