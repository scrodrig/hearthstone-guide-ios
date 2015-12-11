//
//  CardUtilTest.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 10/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import XCTest

class CardUtilTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testParseCards() {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let response = "[{\"cardId\":\"EX1_383t\",\"name\":\"Ashbringer\",\"cardSet\":\"Classic\",\"type\":\"Weapon\",\"rarity\":\"Legendary\",\"cost\":5,\"attack\":5,\"durability\":3,\"playerClass\":\"Paladin\",\"img\":\"http://wow.zamimg.com/images/hearthstone/cards/enus/original/EX1_383t.png\",\"imgGold\":\"http://wow.zamimg.com/images/hearthstone/cards/enus/animated/EX1_383t_premium.gif\",\"locale\":\"enUS\"},{\"cardId\":\"BRM_018\",\"name\":\"Dragon Consort\",\"cardSet\":\"Blackrock Mountain\",\"type\":\"Minion\",\"rarity\":\"Rare\",\"cost\":5,\"attack\":5,\"health\":5,\"text\":\"Battlecry: The next Dragon you play costs (2) less.\",\"flavor\":\"Everybody wants someone to snuggle with. Even giant armored scaly draconic beasts of destruction.\",\"artist\":\"Raymond Swanland\",\"collectible\":true,\"race\":\"Dragon\",\"playerClass\":\"Paladin\",\"howToGet\":\"Unlocked in Blackrock Spire, in the Blackrock Mountain adventure.\",\"howToGetGold\":\"Can be crafted after defeating General Drakkisath in Blackrock Spire.\",\"img\":\"http://wow.zamimg.com/images/hearthstone/cards/enus/original/BRM_018.png\",\"imgGold\":\"http://wow.zamimg.com/images/hearthstone/cards/enus/animated/BRM_018_premium.gif\",\"locale\":\"enUS\",\"mechanics\":[{\"name\":\"Battlecry\"}]},{\"cardId\":\"AT_104\",\"name\":\"Tuskarr Jouster\",\"cardSet\":\"The Grand Tournament\",\"type\":\"Minion\",\"rarity\":\"Rare\",\"cost\":5,\"attack\":5,\"health\":5,\"text\":\"Battlecry: Reveal a minion in each deck. If yours costs more, restore 7 Health to your hero.\",\"flavor\":\"Just could not be talked out of using his turtle for the joust...\",\"artist\":\"Skan Srisuwan\",\"collectible\":true,\"playerClass\":\"Paladin\",\"img\":\"http://wow.zamimg.com/images/hearthstone/cards/enus/original/AT_104.png\",\"imgGold\":\"http://wow.zamimg.com/images/hearthstone/cards/enus/animated/AT_104_premium.gif\",\"locale\":\"enUS\",\"mechanics\":[{\"name\":\"Battlecry\"}]}]";
        
        XCTAssertNil(CardUtil.parseCards(nil));
        
        let data = response.dataUsingEncoding(NSUTF8StringEncoding);
        let cards = CardUtil.parseCards(data);
        
        print(cards);
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
