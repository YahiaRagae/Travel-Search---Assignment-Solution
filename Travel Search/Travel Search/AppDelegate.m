//
//  AppDelegate.m
//  Travel Search
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//


#import "AppDelegate.h"
#import "SplashScreenViewController.h"
#import <ABCustomUINavigationController/CubeNavigationController.h>
#import <TSMessages/TSMessage.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    SplashScreenViewController * vc= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SplashScreenViewController" ];
 
    
    CubeNavigationController * nav =[[CubeNavigationController alloc] initWithRootViewController:vc];
    
    [nav.navigationBar setHidden:true];
    
    self.window.rootViewController=nav;
    [self.window makeKeyAndVisible];
    
    [self checkConnectivity];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma
#pragma mark-  Connectivity
-(void) checkConnectivity {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
}
- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    if (curReach ==  reachability)
    {
        NetworkStatus netStatus = [curReach currentReachabilityStatus];
        
        switch (netStatus) {
            case ReachableViaWiFi:
            case ReachableViaWWAN:
            {
                 [TSMessage dismissActiveNotification];
                self.internetStatus = YES;
                
            }
                break;
                
            case NotReachable:
            {
                NSLog(@"UNREACHABLE!");
                self.internetStatus = NO;
                
                [TSMessage showNotificationInViewController:[UIApplication sharedApplication].keyWindow.rootViewController
                                                      title:@"Internet Connection Failed"
                                                   subtitle:@"Please make sure that you are connected"
                                                      image:nil
                                                       type:TSMessageNotificationTypeError
                                                   duration:-1
                                                   callback:nil
                                                buttonTitle:nil
                                             buttonCallback:nil
                                                 atPosition:TSMessageNotificationPositionBottom
                                       canBeDismissedByUser:NO];
            }
                
                break;
        }
    }
    
    
    
}

@end
