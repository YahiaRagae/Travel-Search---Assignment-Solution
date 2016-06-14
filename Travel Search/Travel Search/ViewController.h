//
//  ViewController.h
//  Travel Search
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//
//http://www.goeuro.de/job-description?gh_jid=32973&apply=true
//https://github.com/gaurvw/MPGTextField
#import <UIKit/UIKit.h>
#import "MPGTextField.h"
#import "Validator.h"
#import <AFViewShaker/AFViewShaker.h>

@interface ViewController : UITableViewController <ValidatorDelegate>

@property (weak, nonatomic) IBOutlet MPGTextField *tfDepartureCity;
@property (weak, nonatomic) IBOutlet MPGTextField *tfDistinationCity;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actIndicatorDeparture;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actIndicatorDistination;

@property (weak, nonatomic) IBOutlet UIButton *btnDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;


- (IBAction)btnSearchAction:(id)sender;
- (IBAction)btnDatePickerAction:(id)sender;


@end

