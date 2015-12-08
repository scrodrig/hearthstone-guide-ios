//
//  LocationEnum.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 08/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

enum Location: String {
    
    case USAEnglish = "enUS";
    
    case BritainEnglish = "enGB";
    
    case German = "deDE";
    
    case SpainSpanish = "esES";
    
    case MexicoSpanish = "esMX";
    
    case French = "frFR";
    
    case Italian = "itIT";
    
    case Korean = "koKR";
    
    case PortugalPortuguese = "plPL";
    
    case BrazilPortuguese = "ptBR";
    
    case Russian = "ruRU";
    
    case ChinaChinese = "zhCN";
    
    case TaiwanChinese = "zhTW";
    
    case Japanese = "jaJP";
    
//    func getLocationValue() -> String {
//        switch self {
//        case .USAEnglish:
//            return "enUS";
//        case .BritainEnglish:
//            return "enGB";
//        case .German:
//            return "deDE";
//        case .SpainSpanish:
//            return "esES";
//        case .MexicoSpanish:
//            return "esMX";
//        case .French:
//            return "frFR";
//        case .Italian:
//            return "itIT";
//        case .Korean:
//            return "koKR";
//        case .PortugalPortuguese:
//            return "plPL";
//        case .BrazilPortuguese:
//            return "ptBR";
//        case .Russian:
//            return "ruRU";
//        case .ChinaChinese:
//            return "zhCN";
//        case .TaiwanChinese:
//            return "zhTW";
//        case .Japanese:
//            return "jaJP";
//        }
//    }
    
    static func getLocationType(value:String) -> Location {
        switch value {
        case "enUS":
            return Location.USAEnglish;
        case "enGB":
            return Location.BritainEnglish;
        case "deDE":
            return Location.German;
        case "esES":
            return Location.SpainSpanish;
        case "esMX":
            return Location.MexicoSpanish;
        case "frFR":
            return Location.French;
        case "itIT":
            return Location.Italian;
        case "koKR":
            return Location.Korean;
        case "plPL":
            return Location.PortugalPortuguese;
        case "ptBR":
            return Location.BrazilPortuguese;
        case "ruRU":
            return Location.Russian;
        case "zhCN":
            return Location.ChinaChinese;
        case "zhTW":
            return Location.TaiwanChinese;
        case "jaJP":
            return Location.Japanese;
        default:
            return Location.USAEnglish
        }
    }
    
}