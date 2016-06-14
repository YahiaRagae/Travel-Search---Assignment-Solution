//
//  OnlineController.swift
//  Travel Search
//
//  Created by Yahia Mahrous on 6/13/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

import Foundation
import Alamofire

public class OnlineController: NSObject {
    
    
    class var sharedInstance: OnlineController  {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: OnlineController? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = OnlineController()
        }
        return Static.instance!
    }
    
    
    override init() {
        super.init() 
    }
    // MARK:- getCities
    func getCities(term : String  , withCompletion completion:(items : NSMutableArray, status : Bool )->Void)
    {
        CitiesDataFetcher().getCities(term) { (items, status) in
            
            completion(items :items,status: status)
        }
        
    }
    
}
