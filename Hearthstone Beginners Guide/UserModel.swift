//
//  UserModel.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 03/01/16.
//  Copyright © 2016 Schubert David Rodríguez. All rights reserved.
//

import Foundation

import Foundation


class User {
    
    var id:String?;
    
    var name:String;
    
    var email:String?;
    
    var picture:UIImage?;
    
    var cover:UIImage?;
    
    init(){
        self.id = nil;
        self.name = "Guest";
        self.email = nil;
        self.picture = nil;
        self.cover = nil;
    }
    
}