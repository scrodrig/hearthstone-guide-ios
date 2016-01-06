//
//  HeroesEnum.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 07/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

enum Heroes: String {
    
    case None = "None";
    
    case Druid = "Druid";
    
    case Hunter = "Hunter";
    
    case Mage = "Mage";
    
    case Paladin = "Paladin";
    
    case Priest = "Priest";
    
    case Rogue = "Rogue";
    
    case Shaman = "Shaman";
    
    case Warlock = "Warlock";
    
    case Warrior = "Warrior";
    
    case Dream = "Dream";
    
    static func getAsArrayValues () -> [String]{
        return [Heroes.Druid.rawValue,Heroes.Hunter.rawValue,Heroes.Mage.rawValue,Heroes.Paladin.rawValue,Heroes.Priest.rawValue,
            Heroes.Rogue.rawValue,Heroes.Shaman.rawValue,Heroes.Warlock.rawValue,Heroes.Warrior.rawValue,Heroes.Warlock.rawValue];
    }
    
    static func getAsArrayValuesWithNone () -> [String]{
        return [Heroes.None.rawValue,Heroes.Druid.rawValue,Heroes.Hunter.rawValue,Heroes.Mage.rawValue,Heroes.Paladin.rawValue,Heroes.Priest.rawValue,
            Heroes.Rogue.rawValue,Heroes.Shaman.rawValue,Heroes.Warlock.rawValue,Heroes.Warrior.rawValue,Heroes.Warlock.rawValue];
    }
}