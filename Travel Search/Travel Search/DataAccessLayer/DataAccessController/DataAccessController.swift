//
//  DataAccessController.swift
//  Travel Search
//
//  Created by Yahia Mahrous on 6/13/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//


import Foundation

 
@objc public class DataAccessController: NSObject {
    var dbController:DBContontroller!
    var onlineController:OnlineController!
    @objc public var dataSource:DataSource = .Online
 
    
    @objc public enum DataSource:Int {
        case Online
        case DB
    }
    
    class var sharedInstance: DataAccessController {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: DataAccessController? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = DataAccessController()
        }
        return Static.instance!
    }
    
    
    override init() {
        super.init()

         
        onlineController = OnlineController.sharedInstance
        
    }
    
    // MARK:- getCities
    
    func getCities(term : String  , withCompletion completion:(items : NSMutableArray, status : Bool )->Void) {
        
            switch dataSource {
            case .Online:
                onlineController.getCities(term, withCompletion: completion)
            case .DB:
                NSLog("DB")
        }
        
    }
    

}