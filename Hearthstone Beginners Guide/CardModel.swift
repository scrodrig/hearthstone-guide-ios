//
//  CardModel.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 09/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

struct Card {
    
    let cardId:String;
    
    let name:String;
    
    let cardSet:String?;
    
    let type:String?;
    
    let faction:String?;
    
    let rarity:String?;
    
    let cost:Int?;
    
    let attack:Int?;
    
    let health:Int?;
    
    let durability:Int?;
    
    let text:String?;
    
    let inPlayText:String?;
    
    let flavor:String?;
    
    let artist:String?;
    
    let collectible:Bool?;
    
    let elite:Bool?;
    
    let img:String?;
    
    let imgGold:String?;
    
    let race:String?;
    
    let playerClass:String?;
    
    let howToGet:String?;
    
    let howToGetGold:String?;
    
    let locale:Location;
    
    let mechanics:[Mechanic]?;
    
}