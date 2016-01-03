//
//  MechanicModel.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 09/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation


class Mechanic: NSObject, NSCoding {
    
    let name:String;
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: DecoderConstants.Mechanic.NAME);
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(DecoderConstants.Mechanic.NAME) as? String ?? "";
    }
    
    init (name:String){
        self.name = name;
    }
    
}