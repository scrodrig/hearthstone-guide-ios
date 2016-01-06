//
//  CustomSearchClient.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 06/01/16.
//  Copyright © 2016 Schubert David Rodríguez. All rights reserved.
//

import Foundation


class SearchByCustomClient {
    
    static func searchCardsByParameters(attack: String?,health: String?, cost: String?, durability: String?, location: Location,completionHandler: ([Card]?, NSError?) -> Void) -> NSURLSessionDataTask?
    {
        //h/ttps://omgvamp-hearthstone-v1.p.mashape.com/cards?attack=1&cost=1&durability=11&health=1
        guard let locationQuery:Location = location else {
            return nil;
        }
        
        //Build a URL to connect with the server
        guard let url = NSURL(string: ParameterConstants.HEARTHSTONE_API_URI + Endpoints.HEARTHSTONE_API_CLASS_CARDS.rawValue
            + ParameterConstants.HEARTHSTONE_API_PARAMETER_LOCALE_INCLUDED
            + locationQuery.rawValue
            + self.checkParameter(ParameterConstants.HEARTHSTONE_API_PARAMETER_ATTACK_INCLUDED, value: attack)
            + self.checkParameter(ParameterConstants.HEARTHSTONE_API_PARAMETER_COST_INCLUDED, value: cost)
            + self.checkParameter(ParameterConstants.HEARTHSTONE_API_PARAMETER_DURABILITY_INCLUDED, value: durability)
            + self.checkParameter(ParameterConstants.HEARTHSTONE_API_PARAMETER_HEALTH_INCLUDED, value: health)) else{
                return nil;
        }
        
        //Add headers for session
        let headers = [ParameterConstants.KEY_HEADER_HEARTHSTONE_API: ParameterConstants.VALUE_HEADER_HEARTSTONE_API]
        //Create a configuration with default data
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration();
        //Add Headers for session configurations (Dictionary pair/value)
        sessionConfiguration.HTTPAdditionalHeaders = headers;
        //Create session with session configiguration
        let session = NSURLSession(configuration: sessionConfiguration);
        //Resume the task to wait for asynchronuos methods
        let sessionTask = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            let cards = CardUtil.parseCardsBySet(data);
            completionHandler(cards, error);
        }
        
        //Resume the task to waiti for asynchronuos methods
        sessionTask.resume();
        
        return sessionTask;        
    }
    
    static func checkParameter(parameter: String, value:String?) -> String{
        if let valueParameter = value {
            return parameter + valueParameter;
        } else {
            return "";
        }
    }
    
}