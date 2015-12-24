//
//  SetEnum.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 17/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

enum Sets: String {
    
    case Classic = "Classic";
    
    case Basic = "Basic";
    
    case Credits = "Credits";
    
    case Naxxramas = "Naxxramas";
    
    case Debug = "Debug";
    
    case GoblinsVsGnomes = "Goblins vs Gnomes";
    
    case Missions = "Missions";
    
    case Promotion = "Promotion";
    
    case Reward = "Reward";
    
    case BlackrockMountain = "Blackrock Mountain";
    
    //case HeroSkins = "Hero Skins";
    
    case TavernBrawl = "Tavern Brawl";
    
    case TheGrandTournament = "The Grand Tournament";
    
    case TheLeagueOfExplorers = "The League of Explorers";
    
    
    
    static func getAsArrayValues () -> [String]{
        return [Sets.Classic.rawValue,Sets.Basic.rawValue,Sets.Credits.rawValue,Sets.Naxxramas.rawValue,Sets.Debug.rawValue,
            Sets.GoblinsVsGnomes.rawValue,Sets.Missions.rawValue,Sets.Promotion.rawValue,Sets.Reward.rawValue,Sets.BlackrockMountain.rawValue,Sets.TavernBrawl.rawValue,Sets.TheGrandTournament.rawValue,Sets.TheLeagueOfExplorers.rawValue];
    }
    
    
    
    
}