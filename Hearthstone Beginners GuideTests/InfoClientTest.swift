//
//  InfoTest.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 07/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import XCTest

class InfoClientTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseInfo() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let responseString = "{\"patch\":\"4.1.0.10956\",\"classes\":[\"Druid\",\"Hunter\",\"Mage\",\"Paladin\",\"Priest\",\"Rogue\",\"Shaman\",\"Warlock\",\"Warrior\",\"Dream\"],\"sets\":[\"Basic\",\"Classic\",\"Credits\",\"Naxxramas\",\"Debug\",\"Goblins vs Gnomes\",\"Missions\",\"Promotion\",\"Reward\",\"System\",\"Blackrock Mountain\",\"Hero Skins\",\"Tavern Brawl\",\"The Grand Tournament\",\"The League of Explorers\"],\"types\":[\"Hero\",\"Minion\",\"Spell\",\"Enchantment\",\"Weapon\",\"Hero Power\"],\"factions\":[\"Horde\",\"Alliance\",\"Neutral\"],\"qualities\":[\"Free\",\"Common\",\"Rare\",\"Epic\",\"Legendary\"],\"races\":[\"Demon\",\"Dragon\",\"Mech\",\"Murloc\",\"Beast\",\"Pirate\",\"Totem\"],\"locales\":[\"deDE\",\"enGB\",\"enUS\",\"esES\",\"esMX\",\"frFR\",\"itIT\",\"koKR\",\"plPL\",\"ptBR\",\"ruRU\",\"zhCN\",\"zhTW\",\"jaJP\"]}";
        XCTAssertNil(InfoClient.parseInfo(nil));
        
        let data = responseString.dataUsingEncoding(NSUTF8StringEncoding);
        let info = InfoClient.parseInfo(data);
        
        print(info);
        
    }
    
    func testSearchInfo(){
        let expectation = expectationWithDescription("going to fetch info")
        //static func searchInfo(completionHandler: (Info?, NSError?) -> Void) -> Void {
        InfoClient.searchInfo() { (info, error) -> Void in
            XCTAssertNotNil(info);
            XCTAssertNil(error);
            expectation.fulfill();
        }
        
        waitForExpectationsWithTimeout(5) {(error) -> Void in
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
