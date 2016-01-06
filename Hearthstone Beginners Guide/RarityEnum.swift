//
//  RarityEnum.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 19/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

enum Rarity: String {
    
    case None = "None";
        
    case Free = "Free";
    
    case Common = "Common";
    
    case Rare = "Rare";
    
    case Epic = "Epic";
    
    case Legendary = "Legendary";
    
    
    static func getAsArrayValues () -> [String]{
        return [Rarity.Free.rawValue,Rarity.Common.rawValue,Rarity.Rare.rawValue,Rarity.Epic.rawValue,Rarity.Legendary.rawValue];
    }
    
    static func getAsArrayValuesWithNone () -> [String]{
        return [Rarity.None.rawValue,Rarity.Free.rawValue,Rarity.Common.rawValue,Rarity.Rare.rawValue,Rarity.Epic.rawValue,Rarity.Legendary.rawValue];
    }

    
    
    
}