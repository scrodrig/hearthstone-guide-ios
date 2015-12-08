//
//  CardbackClient.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 08/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import Foundation

class CardbackClient {
    
    static func searchCardbacks(query: String?,completionHandler: ([Cardback]?, NSError?) -> Void) -> Void {
        
        guard let queryString:String = query else {
            return;
        }
        
        guard let url = NSURL(string: "https://omgvamp-hearthstone-v1.p.mashape.com/cardbacks?locale="+queryString) else{
            return;
        }
        //Headers
        let headers = ["X-Mashape-Key": "28ZQzzNN3wmshDn0xeezaFdlEJB2p1MNp1ijsnk5PgHIgp0c1k"]
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration();
        sessionConfiguration.HTTPAdditionalHeaders = headers;
        let session = NSURLSession(configuration: sessionConfiguration);
        
        let sessionTask = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            let info = parseCardbacks(data);
            completionHandler(info, error);
        }
        sessionTask.resume();

        
    }
    
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
                        let locale = cardBackJson.objectForKey("locale") as! String;
                        
                        
                        cardbacks.append(Cardback(cardBackId:cardBackId,name: name
                            ,description: description, source: source, sourceDescription: sourceDescription,howToGet: howToGet, enabled: enabled,img:img,imgAnimated: imgAnimated, sortCategory: sortCategory, sortOrder: sortOrder,locale: locale));
                    }
                    
                }
                return cardbacks;
                
            }
        }catch{
            
        }
        return nil;
    }
    
    
}