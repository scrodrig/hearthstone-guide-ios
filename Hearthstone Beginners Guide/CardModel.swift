//
//  CardModel.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 09/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

class Card: NSObject, NSCoding {
    
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
    
    var favourite:Bool;
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(cardId, forKey: DecoderConstants.Card.CARD_ID);
        aCoder.encodeObject(name, forKey: DecoderConstants.Card.NAME);
        aCoder.encodeObject(cardSet, forKey:DecoderConstants.Card.CARDSET);
        aCoder.encodeObject(type, forKey:DecoderConstants.Card.TYPE);
        aCoder.encodeObject(faction, forKey:DecoderConstants.Card.FACTION);
        aCoder.encodeObject(rarity, forKey:DecoderConstants.Card.RARITY);
        aCoder.encodeObject(cost, forKey:DecoderConstants.Card.COST);
        aCoder.encodeObject(attack, forKey:DecoderConstants.Card.ATTACK);
        aCoder.encodeObject(health, forKey:DecoderConstants.Card.HEALTH);
        aCoder.encodeObject(durability, forKey:DecoderConstants.Card.DURABILITY);
        aCoder.encodeObject(text, forKey:DecoderConstants.Card.TEXT);
        aCoder.encodeObject(inPlayText, forKey:DecoderConstants.Card.IN_PLAY_TEXT);
        aCoder.encodeObject(flavor, forKey:DecoderConstants.Card.FLAVOR);
        aCoder.encodeObject(artist, forKey:DecoderConstants.Card.ARTIST);
        aCoder.encodeObject(collectible, forKey:DecoderConstants.Card.COLLECTIBLE);
        aCoder.encodeObject(elite, forKey:DecoderConstants.Card.ELITE);
        aCoder.encodeObject(img, forKey:DecoderConstants.Card.IMG);
        aCoder.encodeObject(imgGold, forKey:DecoderConstants.Card.IMG_GOLD);
        aCoder.encodeObject(race, forKey:DecoderConstants.Card.RACE);
        aCoder.encodeObject(playerClass, forKey:DecoderConstants.Card.PLAYER_CLASS);
        aCoder.encodeObject(howToGet, forKey:DecoderConstants.Card.HOW_TO_GET);
        aCoder.encodeObject(howToGetGold, forKey:DecoderConstants.Card.HOW_TO_GET_GOLD);
        aCoder.encodeObject(locale.rawValue, forKey:DecoderConstants.Card.LOCALE);
        aCoder.encodeObject(mechanics, forKey:DecoderConstants.Card.MECHANICS);
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        cardId = aDecoder.decodeObjectForKey(DecoderConstants.Card.CARD_ID) as? String ?? "";
        name = aDecoder.decodeObjectForKey(DecoderConstants.Card.NAME) as? String ?? "";
        cardSet = aDecoder.decodeObjectForKey(DecoderConstants.Card.CARDSET) as? String;
        type = aDecoder.decodeObjectForKey(DecoderConstants.Card.TYPE) as? String;
        faction = aDecoder.decodeObjectForKey(DecoderConstants.Card.FACTION) as? String;
        rarity = aDecoder.decodeObjectForKey(DecoderConstants.Card.RARITY) as? String;
        cost = aDecoder.decodeObjectForKey(DecoderConstants.Card.COST) as? Int;
        attack = aDecoder.decodeObjectForKey(DecoderConstants.Card.ATTACK) as? Int;
        health = aDecoder.decodeObjectForKey(DecoderConstants.Card.HEALTH) as? Int;
        durability = aDecoder.decodeObjectForKey(DecoderConstants.Card.DURABILITY) as? Int;
        text = aDecoder.decodeObjectForKey(DecoderConstants.Card.TEXT) as? String;
        inPlayText = aDecoder.decodeObjectForKey(DecoderConstants.Card.IN_PLAY_TEXT) as? String;
        flavor = aDecoder.decodeObjectForKey(DecoderConstants.Card.FLAVOR) as? String;
        artist = aDecoder.decodeObjectForKey(DecoderConstants.Card.ARTIST) as? String;
        collectible = aDecoder.decodeObjectForKey(DecoderConstants.Card.COLLECTIBLE) as? Bool;
        elite = aDecoder.decodeObjectForKey(DecoderConstants.Card.ELITE) as? Bool;
        img = aDecoder.decodeObjectForKey(DecoderConstants.Card.IMG) as? String;
        imgGold = aDecoder.decodeObjectForKey(DecoderConstants.Card.IMG_GOLD) as? String;
        race = aDecoder.decodeObjectForKey(DecoderConstants.Card.RACE) as? String;
        playerClass = aDecoder.decodeObjectForKey(DecoderConstants.Card.PLAYER_CLASS) as? String;
        howToGet = aDecoder.decodeObjectForKey(DecoderConstants.Card.HOW_TO_GET) as? String;
        howToGetGold = aDecoder.decodeObjectForKey(DecoderConstants.Card.HOW_TO_GET_GOLD) as? String;
        locale = Location(rawValue: aDecoder.decodeObjectForKey(DecoderConstants.Cardback.LOCALE) as? String ?? "")!;
        mechanics = aDecoder.decodeObjectForKey(DecoderConstants.Card.CARD_ID) as? [Mechanic];
        favourite = false;
    }
    
    init (cardId:String, name: String, cardSet:String?, type:String?,faction:String?, rarity:String?, cost:Int?, attack:Int?, health:Int?, durability: Int?, text: String?, inPlayText:String?, flavor:String?, artist:String?, collectible:Bool?, elite:Bool?, img:String?, imgGold:String?, race:String?, playerClass:String?, howToGet: String?, howToGetGold: String?, locale:Location, mechanics:[Mechanic]?){
        
        self.cardId = cardId;
        self.name = name;
        self.cardSet = cardSet;
        self.type = type;
        self.faction = faction;
        self.rarity = rarity;
        self.cost = cost;
        self.attack = attack;
        self.health = health;
        self.durability = durability;
        self.text = text;
        self.inPlayText = inPlayText;
        self.flavor = flavor;
        self.artist = artist;
        self.collectible = collectible;
        self.elite = elite;
        self.img = img;
        self.imgGold = imgGold;
        self.race = race;
        self.playerClass = playerClass;
        self.howToGet = howToGet;
        self.howToGetGold = howToGetGold;
        self.locale = locale;
        self.mechanics = mechanics;
        self.favourite = false;
    }
    
    
    
    
}