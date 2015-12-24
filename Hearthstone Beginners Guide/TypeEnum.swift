//
//  TypeEnum.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 19/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

enum Type: String {    
    
    case Hero = "Hero";
    
    case Minion = "Minion";
    
    case Spell = "Spell";
    
    case Enchantment = "Enchantment";
    
    case Weapon = "Weapon";
    
    //case HeroPower = "Hero Power";
    
    
    static func getAsArrayValues () -> [String]{
        return [Type.Hero.rawValue,Type.Minion.rawValue,Type.Spell.rawValue,Type.Weapon.rawValue];
    }
    
    
    
    
}