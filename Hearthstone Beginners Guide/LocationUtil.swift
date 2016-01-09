//
//  LocationUtil.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 07/01/16.
//  Copyright © 2016 Schubert David Rodríguez. All rights reserved.
//

import Foundation


class LocationUtil {


    static func getLocation(location:String) -> String {
        
        /*
        static func getAsArrayValues () -> [String]{
        return [Location.USAEnglish.rawValue,Location.BritainEnglish.rawValue,Location.MexicoSpanish.rawValue,Location.BrazilPortuguese.rawValue,Location.Italian.rawValue];
        }
        */
        switch location{
        case Location.USAEnglish.rawValue:
            return "English USA";
        case Location.BritainEnglish.rawValue:
            return "Britain English";
        case Location.BrazilPortuguese.rawValue:
            return "Portuguese";
        case Location.MexicoSpanish.rawValue:
            return "Spanish";
        case Location.Italian.rawValue:
            return "Spanish";
        default:
            return "English USA";
        }
    }
    
}