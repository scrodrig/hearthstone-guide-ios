//
//  CardbackModel.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 08/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation


class Cardback: NSObject, NSCoding {
    
    let cardBackId:String;
    
    let name:String;
    
    let p_description:String?;
    
    let source:String?;
    
    let sourceDescription:String?;
    
    let howToGet:String?;
    
    let enabled:Bool;
    
    let img:String?;
    
    let imgAnimated:String?;
    
    let sortCategory:String?;
    
    let sortOrder:String;
    
    let locale:Location;
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(cardBackId, forKey: DecoderConstants.Cardback.CARDBACK_ID);
        aCoder.encodeObject(name, forKey: DecoderConstants.Cardback.NAME);
        aCoder.encodeObject(p_description, forKey:DecoderConstants.Cardback.DESCRIPTION);
        aCoder.encodeObject(source, forKey:DecoderConstants.Cardback.SOURCE);
        aCoder.encodeObject(sourceDescription, forKey:DecoderConstants.Cardback.SOURCE_DESCRIPTION);
        aCoder.encodeObject(howToGet, forKey:DecoderConstants.Cardback.HOW_TO_GET);
        aCoder.encodeObject(enabled, forKey:DecoderConstants.Cardback.ENABLED);
        aCoder.encodeObject(img, forKey:DecoderConstants.Cardback.IMG);
        aCoder.encodeObject(imgAnimated, forKey:DecoderConstants.Cardback.IMG_ANIMATED);
        aCoder.encodeObject(sortCategory, forKey:DecoderConstants.Cardback.SORT_CATEGORY);
        aCoder.encodeObject(sortOrder, forKey:DecoderConstants.Cardback.SORT_ORDEN);
        aCoder.encodeObject(locale.rawValue, forKey:DecoderConstants.Cardback.LOCALE);
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        cardBackId = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.CARDBACK_ID) as? String ?? "";
        name = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.NAME) as? String ?? "";
        p_description = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.DESCRIPTION) as? String;
        source = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.SOURCE) as? String;
        sourceDescription = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.SOURCE_DESCRIPTION) as? String;
        howToGet = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.HOW_TO_GET) as? String;
        enabled = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.ENABLED) as? Bool ?? false;
        img = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.IMG) as? String;
        imgAnimated = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.IMG_ANIMATED) as? String;
        sortCategory = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.SORT_CATEGORY) as? String;
        sortOrder = aDecoder.decodeObjectForKey(DecoderConstants.Cardback.SORT_ORDEN) as? String ?? "";
        locale = Location(rawValue: aDecoder.decodeObjectForKey(DecoderConstants.Cardback.LOCALE) as? String ?? "")!;
    }
    
    init (cardBackId:String, name: String, description:String?, source:String?,sourceDescription:String?, howToGet:String?, enabled:Bool, img:String?, imgAnimated:String?, sortCategory: String?, sortOrder: String, locale:Location){
        self.cardBackId = cardBackId;
        self.name = name;
        self.p_description = description;
        self.source = source;
        self.sourceDescription = sourceDescription;
        self.howToGet = howToGet;
        self.enabled = enabled;
        self.img = img;
        self.imgAnimated = imgAnimated;
        self.sortCategory = sortCategory;
        self.sortOrder = sortOrder;
        self.locale = locale;
    }
    
    
    
    
}