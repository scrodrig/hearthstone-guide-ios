//
//  CardUtil.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 10/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation


class CardUtil {
    
    static func parseCards(data:NSData?) -> [Card]? {
        
        do{
            guard let dta = data else {
                return nil;
            }
            
            if let searchDictionary = try NSJSONSerialization.JSONObjectWithData(dta, options: NSJSONReadingOptions.AllowFragments) as? NSArray{
                var cards = [Card]();
                for(var i = 0; i < searchDictionary.count; i++){
                    if let cardJson = searchDictionary.objectAtIndex(i) as? NSDictionary{
                        
                        
                        let cardId = cardJson.objectForKey("cardId") as! String;
                        
                        let name = cardJson.objectForKey("name") as! String;
                        
                        let cardSet = cardJson.objectForKey("cardSet") as! String;
                        
                        let type = cardJson.objectForKey("type") as! String;
                        
                        let faction = cardJson.objectForKey("faction") as? String;
                        
                        let rarity = cardJson.objectForKey("rarity") as! String;
                        
                        let cost = cardJson.objectForKey("cost") as! Int;
                        
                        let attack = cardJson.objectForKey("attack") as? Int;
                        
                        let health = cardJson.objectForKey("health") as? Int;
                        
                        let durability = cardJson.objectForKey("durability") as? Int;
                        
                        let text = cardJson.objectForKey("text") as? String;
                        
                        let inPlayText = cardJson.objectForKey("inPlayText") as? String;
                        
                        let flavor = cardJson.objectForKey("flavor") as? String;
                        
                        let artist = cardJson.objectForKey("artist") as? String;
                        
                        let collectible = cardJson.objectForKey("collectible") as! Bool;
                        
                        let elite = cardJson.objectForKey("elite") as! Bool;
                        
                        let img = cardJson.objectForKey("img") as? String;
                        
                        let imgGold = cardJson.objectForKey("imgGold") as? String;
                        
                        let race = cardJson.objectForKey("race") as? String;
                        
                        let playerClass = cardJson.objectForKey("playerClass") as? String;
                        
                        let howToGet = cardJson.objectForKey("howToGet") as? String;
                        
                        let howToGetGold = cardJson.objectForKey("howToGetGold") as? String;
                        
                        let locale = cardJson.objectForKey("locale") as! String;
                        
                        //For mechanics
                        var mechanics = [Mechanic]();
                        if let mechanicsJson = cardJson.objectForKey("locale") as? NSArray{
                            for(var j = 0; j < mechanicsJson.count; j++){
                                if let mechanic = mechanicsJson.objectAtIndex(j) as? NSDictionary{
                                    let name = mechanic.objectForKey("name") as! String;
                                    //Add to mechanics list
                                    mechanics.append(Mechanic(name: name));
                                }
                            }
                        }
                        
                        
                        cards.append(Card(cardId: cardId,name: name,cardSet: cardSet,type: type,faction: faction, rarity: rarity,cost: cost,attack: attack,health: health,durability: durability,text: text,inPlayText: inPlayText, flavor: flavor,artist: artist,collectible: collectible,elite: elite, img: img,imgGold: imgGold,race: race,playerClass: playerClass,howToGet: howToGet,howToGetGold: howToGetGold,locale: locale,mechanics: mechanics));
                        
                        
                    }
                    
                }
                return cards;
                
            }
        }catch{
            
        }
        return nil;
        
        
    }
    
}