//
//  CardArchive.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 30/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

class CardArchive {
    
    var documentsPath: NSURL = NSURL()
    var filePath:NSURL = NSURL()
    //Save information for favourite cards
    func saveCards(cards: [Card]){
        documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]);
        print("documentsPath: \(documentsPath)");
        filePath = documentsPath.URLByAppendingPathComponent("FavouriteCards.data");
        let path = filePath.path!;
        if NSKeyedArchiver.archiveRootObject(cards, toFile: path) {
            print("Success")
        } else {
            print("Failure")
        }
    }
    //Retreive data from favourite cards
    func retreiveCards() -> [Card] {
        var dataToRetrieve = [Card]();
        documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0])
        filePath = documentsPath.URLByAppendingPathComponent("FavouriteCards.data", isDirectory: false)
        
        let path = filePath.path!
        
        if let newData = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? NSArray {
            for(var i = 0; i < newData.count; i++){
                if let cardJson = newData.objectAtIndex(i) as? Card{
                    dataToRetrieve.append(cardJson);
                }
            }
        }
        return dataToRetrieve;
    }
    
    
}