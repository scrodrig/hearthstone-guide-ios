//
//  CardbackModel.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 08/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation


struct Cardback {
    
    let cardBackId:String;
    
    let name:String;
    
    let description:String?;
    
    let source:String?;
    
    let sourceDescription:String?;
    
    let howToGet:String?;
    
    let enabled:Bool;
    
    let img:String?;
    
    let imgAnimated:String?;

    let sortCategory:String?;
    
    let sortOrder:String;
    
    let locale:String;
    
}