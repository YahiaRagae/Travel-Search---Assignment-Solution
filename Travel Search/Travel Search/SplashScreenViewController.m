//
//  SplashScreenViewController.m
//  Travel Search
//
//  Created by Yahia Mahrous on 6/13/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "ViewController.h"
#import <ABCustomUINavigationController/CubeNavigationController.h>
@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController
#pragma
#pragma mark - UIViewController LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    //init Shine Animation
    [self AddShineAnimationToView:_lblTitle];
   
    //open App
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self openApp];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma
#pragma mark - Class Methods
-(void)openApp{
    ViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController setViewControllers: [NSArray arrayWithObjects:vc, nil] animated:YES ];
}
#pragma
#pragma mark - Utils Methods

-(void)AddShineAnimationToView:(UIView*)aView
{
    
    aView.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    aView.layer.shadowRadius = 1.0;
    aView.layer.shadowOpacity = 0.5;
    aView.layer.masksToBounds = NO;
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [gradient setStartPoint:CGPointMake(0, 0)];
    [gradient setEndPoint:CGPointMake(1, 0)];
    gradient.frame = CGRectMake(0, 0, aView.bounds.size.width*3, aView.bounds.size.height);
    float lowerAlpha = 0.6;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:1.0] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:1.0] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:1.0] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor],
                       nil];
    gradient.locations = [NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.45],
                          [NSNumber numberWithFloat:0.50],
                          [NSNumber numberWithFloat:0.55],
                          [NSNumber numberWithFloat:0.60],
                          [NSNumber numberWithFloat:0.65],
                          [NSNumber numberWithFloat:1.0],
                          nil];
    
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    theAnimation.duration = .7;
    theAnimation.repeatCount = INFINITY;
    theAnimation.autoreverses = NO;
    theAnimation.removedOnCompletion = NO;
    theAnimation.fillMode = kCAFillModeRemoved;
    theAnimation.fromValue=[NSNumber numberWithFloat:-aView.frame.size.width*2];
    theAnimation.toValue=[NSNumber numberWithFloat:0];
    [gradient addAnimation:theAnimation forKey:@"animateLayer"];
    
    aView.layer.mask = gradient;
}
@end
