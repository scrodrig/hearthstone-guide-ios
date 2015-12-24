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
                cards = self.convertCards(searchDictionary)!;
                return cards;
                
            }
        }catch{
            
        }
        return nil;
    }
    
    static func convertCards(array:NSArray) -> [Card]?{
    
        var cards = [Card]();
        for(var i = 0; i < array.count; i++){
            if let cardJson = array.objectAtIndex(i) as? NSDictionary{
                
                
                let cardId = cardJson.objectForKey("cardId") as! String;
                
                let name = cardJson.objectForKey("name") as! String;
                
                let cardSet = cardJson.objectForKey("cardSet") as? String;
                
                let type = cardJson.objectForKey("type") as? String;
                
                let faction = cardJson.objectForKey("faction") as? String;
                
                let rarity = cardJson.objectForKey("rarity") as? String;
                
                let cost = cardJson.objectForKey("cost") as? Int;
                
                let attack = cardJson.objectForKey("attack") as? Int;
                
                let health = cardJson.objectForKey("health") as? Int;
                
                let durability = cardJson.objectForKey("durability") as? Int;
                
                let text = cardJson.objectForKey("text") as? String;
                
                let inPlayText = cardJson.objectForKey("inPlayText") as? String;
                
                let flavor = cardJson.objectForKey("flavor") as? String;
                
                let artist = cardJson.objectForKey("artist") as? String;
                
                let collectible = cardJson.objectForKey("collectible") as? Bool;
                
                let elite = cardJson.objectForKey("elite") as? Bool;
                
                let img = cardJson.objectForKey("img") as? String;
                
                let imgGold = cardJson.objectForKey("imgGold") as? String;
                
                let race = cardJson.objectForKey("race") as? String;
                
                let playerClass = cardJson.objectForKey("playerClass") as? String;
                
                let howToGet = cardJson.objectForKey("howToGet") as? String;
                
                let howToGetGold = cardJson.objectForKey("howToGetGold") as? String;
                
                let locale = Location(rawValue: cardJson.objectForKey("locale") as! String)
                
                //For mechanics
                var mechanics = [Mechanic]();
                if let mechanicsJson = cardJson.objectForKey("mechanics") as? NSArray{
                    for(var j = 0; j < mechanicsJson.count; j++){
                        if let mechanic = mechanicsJson.objectAtIndex(j) as? NSDictionary{
                            let name = mechanic.objectForKey("name") as! String;
                            //Add to mechanics list
                            mechanics.append(Mechanic(name: name));
                        }
                    }
                }
                
                
                cards.append(Card(cardId: cardId,name: name,cardSet: cardSet,type: type,faction: faction, rarity: rarity,cost: cost,attack: attack,health: health,durability: durability,text: text,inPlayText: inPlayText, flavor: flavor,artist: artist,collectible: collectible,elite: elite, img: img,imgGold: imgGold,race: race,playerClass: playerClass,howToGet: howToGet,howToGetGold: howToGetGold,locale: locale!,mechanics: mechanics));
                
                
            }
            
        }
        return cards.filter({ (card:Card) -> Bool in
            if(card.img != nil && card.cost != nil && card.rarity != nil){
                return true;
            }
            return false;
        });
        
    }
    
    static func parseCardsBySet(data:NSData?) -> [Card]? {
        //Save data to prevent the response received is not empty
        do{
            guard let dta = data else {
                return nil;
            }
            var cards = [Card]();
            if let searchDictionary = try NSJSONSerialization.JSONObjectWithData(dta, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary{
                //Basics
                if let basicCards = searchDictionary.objectForKey(Sets.Basic.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(basicCards)!);
                }
                //Classics
                if let classicCards = searchDictionary.objectForKey(Sets.Classic.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(classicCards)!);
                }
                //Credits
                if let creditsCards = searchDictionary.objectForKey(Sets.Credits.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(creditsCards)!);
                }
                //Naxxramas
                if let naxxramasCards = searchDictionary.objectForKey(Sets.Naxxramas.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(naxxramasCards)!);
                }
                //Debug
                if let debugCards = searchDictionary.objectForKey(Sets.Debug.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(debugCards)!);
                }
                //Goblins vs Gnomes
                if let gvgCards = searchDictionary.objectForKey(Sets.GoblinsVsGnomes.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(gvgCards)!);
                }
                //Missions
                if let missionsCards = searchDictionary.objectForKey(Sets.Missions.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(missionsCards)!);
                }
                //Promotion
                if let promotionCards = searchDictionary.objectForKey(Sets.Promotion.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(promotionCards)!);
                }
                //Reward
                if let rewardCards = searchDictionary.objectForKey(Sets.Reward.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(rewardCards)!);
                }
                //Blackrock Mountain
                if let brmCards = searchDictionary.objectForKey(Sets.BlackrockMountain.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(brmCards)!);
                }
                //Hero Skins
//                if let heroCards = searchDictionary.objectForKey(Sets.HeroSkins.rawValue) as? NSArray{
//                    cards.appendContentsOf(self.convertCards(heroCards)!);
//                }
                //Tavern Brawl
                if let brawlCards = searchDictionary.objectForKey(Sets.TavernBrawl.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(brawlCards)!);
                }
                //The Grand Tournament
                if let tgtCards = searchDictionary.objectForKey(Sets.TheGrandTournament.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(tgtCards)!);
                }
                //TheLeagueOfExplorers
                if let tleCards = searchDictionary.objectForKey(Sets.TheLeagueOfExplorers.rawValue) as? NSArray{
                    cards.appendContentsOf(self.convertCards(tleCards)!);
                }
                
            }
            return cards;
        }catch{
            
        }        
        return nil;
    }
    
}