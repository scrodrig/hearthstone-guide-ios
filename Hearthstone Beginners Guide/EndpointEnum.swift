//
//  EndpointEnum.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 11/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

enum Endpoints:String {
    
    case HEARTHSTONE_API_INFO_ENDPOINT = "/info";
    
    case HEARTHSTONE_API_CLASS_CARDS = "/cards/";
    
    case HEARTHSTONE_API_CLASS_CARDS_ENDPOINT = "/cards/classes/";
    
    case HEARTHSTONE_API_CARDS_SEARCH_NAME_ENDPOINT = "/cards/search/";
    
    case HEARTHSTONE_API_CARDS_SET_ENDPOINT = "/cards/sets/"
    
    
    case HEARTHSTONE_API_CARDS_RACE_ENDPOINT = "/cards/races/"
    
    case HEARTHSTONE_API_CARDS_QUALITY_ENDPOINT = "/cards/qualities/"
    
    case HEARTHSTONE_API_CARDS_TYPE_ENDPOINT = "/cards/types/"
    
    case HEARTHSTONE_API_CARDS_FACTION_ENDPOINT = "/cards/factions/";
    
    case HEARTHSTONE_API_CARDBACK_ENDPOINT = "/cardbacks";
    
}