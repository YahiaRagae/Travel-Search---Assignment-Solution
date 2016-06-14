//
//  AppDelegate.h
//  Travel Search
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
       Reachability *reachability;
}

@property (nonatomic , assign) Boolean internetStatus;
@property (strong, nonatomic) UIWindow *window;


@end

