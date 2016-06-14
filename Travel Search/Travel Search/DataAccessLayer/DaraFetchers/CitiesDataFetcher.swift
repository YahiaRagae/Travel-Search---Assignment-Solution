//
//  CitiesDataFetcher.swift
//  Travel Search
//
//  Created by Yahia Mahrous on 6/13/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

import Foundation
import Alamofire

class CitiesDataFetcher: BaseDataFetcher {
    let URL_CITIES : String = "URL_CITIES"
 
    func getCities(term : String  , withCompletion completion:(items : NSMutableArray, status : Bool )->Void)
    {
        
        
        let link = "\(getLink(URL_CITIES))de/" + term.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())! ;
            
        getRequestWithJsonReponse(link: link) { (response, status) in
            let items:NSMutableArray = self.parseCities(response: response)
            completion(items: items , status: status)
            
        }
    }
 
         
    
    // MARK: Parsers
    func parseCities(response response: Response<AnyObject, NSError>) -> NSMutableArray{
        let items:NSMutableArray = NSMutableArray();
        
       let jsonArray = response.result.value as! NSArray
        if(jsonArray.count > 0){
            for dictIitem in jsonArray {
                let place:PlaceItem = PlaceItem(dictionary: dictIitem as! [NSObject : AnyObject])
                items.addObject(place)
            }
        }

        return items;
    }

}