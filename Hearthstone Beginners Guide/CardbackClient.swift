//
//  CardbackClient.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 08/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

class CardbackClient {
    
    
    //Make connection with api server
    static func searchCardbacks(location: Location?,completionHandler: ([Cardback]?, NSError?) -> Void) -> Void {
        //Check veracity for location selection
        guard let locationQuery:Location = location else {
            return;
        }
        //Build a URL to connect with the server
        guard let url = NSURL(string: ParameterConstants.HEARTHSTONE_API_URI + Endpoints.HEARTHSTONE_API_CARDBACK_ENDPOINT.rawValue + ParameterConstants.HEARTHSTONE_API_PARAMETER_LOCALE + locationQuery.rawValue) else{
            return;            
        }
        //Add headers for session
        let headers = [ParameterConstants.KEY_HEADER_HEARTHSTONE_API: ParameterConstants.VALUE_HEADER_HEARTSTONE_API];
        //Create a configuration with default data
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration();
        //Add Headers for session configurations (Dictionary pair/value)
        sessionConfiguration.HTTPAdditionalHeaders = headers;
        //Create session with session configiguration
        let session = NSURLSession(configuration: sessionConfiguration);
        //Resume the task to wait for asynchronuos methods
        let sessionTask = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            let cardbacks = parseCardbacks(data);
            completionHandler(cardbacks, error);
        }
        sessionTask.resume();

        
    }
    
    
    //Convert from data to cardback model
    static func parseCardbacks(data:NSData?) -> [Cardback]? {
        do{
            guard let dta = data else {
                return nil;
            }
            if let searchDictionary = try NSJSONSerialization.JSONObjectWithData(dta, options: NSJSONReadingOptions.AllowFragments) as? NSArray{
                var cardbacks = [Cardback]();
                for(var i = 0; i < searchDictionary.count; i++){
                    if let cardBackJson = searchDictionary.objectAtIndex(i) as? NSDictionary{
                        let cardBackId = cardBackJson.objectForKey("cardBackId") as! String;
                        let name = cardBackJson.objectForKey("name") as! String;
                        let description = cardBackJson.objectForKey("description") as! String;
                        let source = cardBackJson.objectForKey("source") as! String;
                        let sourceDescription = cardBackJson.objectForKey("sourceDescription") as? String;
                        let howToGet = cardBackJson.objectForKey("howToGet") as? String;
                        let enabled = cardBackJson.objectForKey("enabled") as! Bool;
                        let img = cardBackJson.objectForKey("img") as! String;
                        let imgAnimated = cardBackJson.objectForKey("imgAnimated") as! String;
                        let sortCategory = cardBackJson.objectForKey("sortCategory") as! String;
                        let sortOrder = cardBackJson.objectForKey("sortOrder") as! String;
                        let locale = Location(rawValue: cardBackJson.objectForKey("locale") as! String);
                        
                    
                        
                        
                        cardbacks.append(Cardback(cardBackId:cardBackId,name: name
                            ,description: description, source: source, sourceDescription: sourceDescription,howToGet: howToGet, enabled: enabled,img:img,imgAnimated: imgAnimated, sortCategory: sortCategory, sortOrder: sortOrder,locale: locale!));
                    }
                    
                }
                return cardbacks;
                
            }
        }catch{
            
        }
        return nil;
    }
    
    
}