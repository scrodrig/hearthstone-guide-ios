//
//  InfoModel.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 07/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

class Info: NSObject, NSCoding {
    
    let patch:String;
    
    let classes:[String];
    
    let sets : [String];
    
    let types : [String];
    
    let factions : [String];
    
    let qualities : [String];
    
    let races : [String];
    
    let locales : [String];
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(patch, forKey: DecoderConstants.Info.PATCH);
        aCoder.encodeObject(classes, forKey: DecoderConstants.Info.CLASSES);
        aCoder.encodeObject(sets, forKey:DecoderConstants.Info.SETS);
        aCoder.encodeObject(types, forKey:DecoderConstants.Info.TYPES);
        aCoder.encodeObject(factions, forKey:DecoderConstants.Info.FACTIONS);
        aCoder.encodeObject(qualities, forKey:DecoderConstants.Info.QUALITIES);
        aCoder.encodeObject(races, forKey:DecoderConstants.Info.RACES);
        aCoder.encodeObject(locales, forKey:DecoderConstants.Info.LOCALES);
    }
    
    required init?(coder aDecoder: NSCoder) {
        patch = aDecoder.decodeObjectForKey(DecoderConstants.Info.PATCH) as? String ?? "";
        classes = aDecoder.decodeObjectForKey(DecoderConstants.Info.CLASSES) as? [String] ?? [];
        sets = aDecoder.decodeObjectForKey(DecoderConstants.Info.SETS) as? [String] ?? [];
        types = aDecoder.decodeObjectForKey(DecoderConstants.Info.TYPES) as? [String] ?? [];
        factions = aDecoder.decodeObjectForKey(DecoderConstants.Info.FACTIONS) as? [String] ?? [];
        qualities = aDecoder.decodeObjectForKey(DecoderConstants.Info.QUALITIES) as? [String] ?? [];
        races = aDecoder.decodeObjectForKey(DecoderConstants.Info.RACES) as? [String] ?? [];
        locales = aDecoder.decodeObjectForKey(DecoderConstants.Info.LOCALES) as? [String] ?? [];        
    }
    
    init (patch:String, classes: [String], sets:[String], types:[String], factions:[String], qualities:[String], races:[String], locales:[String]){
        self.patch = patch;
        self.classes = classes;
        self.sets = sets;
        self.types = types;
        self.factions = factions;
        self.qualities = qualities;
        self.races = races;
        self.locales = locales;
    }
    

    
}
