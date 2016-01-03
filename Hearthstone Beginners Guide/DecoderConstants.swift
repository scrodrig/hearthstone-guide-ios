//
//  DeCoderConst.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 30/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

struct DecoderConstants {
    
    //Info class information
    struct Info {
        static let PATCH:String = "patch";
        static let CLASSES:String = "classes";
        static let SETS:String = "sets";
        static let TYPES:String = "types";
        static let FACTIONS:String = "factions";
        static let QUALITIES:String = "qualities";
        static let RACES:String = "races";
        static let LOCALES:String = "locales";
    }
    
    //Cardback class information
    struct Cardback {
        static let CARDBACK_ID:String = "cardBackId";
        static let NAME:String = "name";
        static let DESCRIPTION:String = "p_description";
        static let SOURCE:String = "source";
        static let SOURCE_DESCRIPTION:String = "sourceDescription";
        static let HOW_TO_GET:String = "howToGet";
        static let ENABLED:String = "enabled";
        static let IMG:String = "img";
        static let IMG_ANIMATED:String = "imgAnimated";
        static let SORT_CATEGORY:String = "sortCategory";
        static let SORT_ORDEN:String = "sortOrder";
        static let LOCALE:String = "locale";
    }
    
    //Card class information
    struct Card {
        static let CARD_ID:String = "cardId";
        static let NAME:String = "name";
        static let CARDSET:String = "cardSet";
        static let TYPE:String = "type";
        static let FACTION:String = "faction";
        static let RARITY:String = "rarity";
        static let COST:String = "cost";
        static let ATTACK:String = "attack";
        static let HEALTH:String = "health";
        static let DURABILITY:String = "durability";
        static let TEXT:String = "text";
        static let IN_PLAY_TEXT:String = "inPlayText";
        static let FLAVOR:String = "flavor";
        static let ARTIST:String = "artist";
        static let COLLECTIBLE:String = "collectible";
        static let ELITE:String = "elite";
        static let IMG:String = "img";
        static let IMG_GOLD:String = "imgGold";
        static let RACE:String = "race";
        static let PLAYER_CLASS:String = "playerClass";
        static let HOW_TO_GET:String = "howToGet";
        static let HOW_TO_GET_GOLD:String = "howToGetGold";
        static let LOCALE:String = "locale";
        static let MECHANICS:String = "mechanics";
    }
    
    //Mechanic class information
    struct Mechanic {
        static let NAME:String = "name";
    }
    
    
    
}