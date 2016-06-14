//
//  ViewController.m
//  Travel Search
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import "ViewController.h"
#import "Travel_Search-Swift.h"
#import <CoreLocation/CoreLocation.h>
#import "ActionSheetPicker.h"
#import <Toast/UIView+Toast.h>
@interface ViewController ()

@end

@implementation ViewController
#pragma
#pragma mark - UITableViewController LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self initViews];
}
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma
#pragma mark - Class Methods
-(void)initData{
    NSDateFormatter *formatter; 
    if(currentSelectedDate == nil ){
        currentSelectedDate =[NSDate date];
    }
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    [self.btnDatePicker setTitle:[formatter stringFromDate:currentSelectedDate] forState:UIControlStateNormal];
}
-(void) initViews{
    //init BackGround
    UIView * bg= [[UIView alloc] initWithFrame:self.view.frame];
    UIImageView * img = [[UIImageView alloc] initWithFrame:self.view.frame];
    img.image = [UIImage imageNamed:@"bg"];
    img.alpha=0.2;
    [bg addSubview:img];
    [self.tableView setBackgroundView:bg];
    
    //init TFs
    
    [self.tfDistinationCity setAutoCompleteTableAppearsAsKeyboardAccessory:YES];
    [self.tfDepartureCity setAutoCompleteTableAppearsAsKeyboardAccessory:YES];
    
    
    //init Search Button
    self.btnSearch.layer.borderColor = [UIColor blackColor].CGColor;
    self.btnSearch.layer.borderWidth = 1;
    self.btnSearch.layer.cornerRadius = 10;
    
    //init DatePickerButton
    self.btnDatePicker.layer.borderColor = [UIColor blackColor].CGColor;
    self.btnDatePicker.layer.borderWidth = 2;
    self.btnDatePicker.layer.cornerRadius = 5;
    
}
-(void)validate{
    Validator * validator= [[Validator alloc] init];
    validator.delegate = self;
    
    [validator putRule:[Rules checkIfStringIsEmpty:self.tfDepartureCity.text WithFailureString:@"" withView:self.tfDepartureCity]];
    [validator putRule:[Rules checkIfStringIsEmpty:self.tfDistinationCity.text WithFailureString:@"" withView:self.tfDistinationCity]];
    
    
    [validator validate];
}
-(void)checkDistance{
    if(distinationItem != nil && departureItem !=nil){
        GeoPosition * distinationGeoPosition=distinationItem.geoPosition;
        GeoPosition * departureGeoPosition=departureItem.geoPosition;
        
        CLLocation *departureLocation = [[CLLocation alloc] initWithLatitude:departureGeoPosition.latitude longitude:departureGeoPosition.longitude];
        
        CLLocation *distinationLocation = [[CLLocation alloc] initWithLatitude:distinationGeoPosition.latitude longitude:distinationGeoPosition.longitude];
        
        
        CLLocationDistance distance = [departureLocation distanceFromLocation:distinationLocation];
        
        self.lblDistance.text = [NSString stringWithFormat:@"%.1f KM",(distance/1000)];
    }else{
        self.lblDistance.text = @"";
    }
}
-(void)dateSelected{
    
}
#pragma
#pragma mark - ValidatorDelegate Methods

- (void)preValidation{
    
}
- (void)onSuccess
{
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];

    [self.view makeToast:@"Search is not yet implemented."
                duration:1.5
                position:CSToastPositionCenter
                   style:style];
}
- (void)onFailure:(Rule *)failedRule{
    AFViewShaker * viewShaker= [[AFViewShaker alloc] initWithView:failedRule.view];
    [viewShaker shake];
    failedRule.view.layer.borderWidth = 2;
    failedRule.view.layer.borderColor = [UIColor redColor].CGColor;
    
}
#pragma
#pragma mark - UITextFieldDelegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(textField == self.tfDistinationCity){
        distinationItem = nil;
    }else{
        departureItem = nil;
    }
    [self checkDistance];
    
    return true;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField == self.tfDistinationCity){
        
        [self.actIndicatorDistination stopAnimating];
    }else{
        
        [self.actIndicatorDeparture stopAnimating];
    }
    [self checkDistance];
}

#pragma
#pragma mark - MLPAutoCompleteTextFieldDelegate Methods
- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
  didSelectAutoCompleteString:(NSString *)selectedString
       withAutoCompleteObject:(id<MLPAutoCompletionObject>)selectedObject
            forRowAtIndexPath:(NSIndexPath *)indexPath{
    PlaceItem * item = (PlaceItem*)[currentSuggestions objectAtIndex:indexPath.row];
    
    if(textField == self.tfDistinationCity){
        distinationItem = item;
    }else{
        departureItem = item;
    }
    [self checkDistance];
}
#pragma
#pragma mark - MLPAutoCompleteTextFieldDataSource Methods
- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
 possibleCompletionsForString:(NSString *)string
            completionHandler:(void (^)(NSArray *))handler
{
    dispatch_async(dispatch_get_main_queue(), ^{
         if(textField == self.tfDistinationCity){
            [self.actIndicatorDistination startAnimating];
        }else{
            [self.actIndicatorDeparture startAnimating];
        }
      });
    if(string.length>0){
        [[DataAccessController sharedInstance] getCities:string withCompletion:^(NSMutableArray * _Nonnull items, BOOL status) {
            currentSuggestions = items;
            currentSuggestionsStrings = [[NSMutableArray alloc]init];
            for(int x=0;x<items.count;x++){
                PlaceItem * item = (PlaceItem * )[items objectAtIndex:x];
                
                [currentSuggestionsStrings addObject:item.name];
            }
            handler(currentSuggestionsStrings);
            if(textField == self.tfDistinationCity){
                distinationItem = nil;
                [self.actIndicatorDistination stopAnimating];
            }else{
                departureItem = nil;
                [self.actIndicatorDeparture stopAnimating];
            }
        }];
    }else if(currentSuggestionsStrings != nil && currentSuggestionsStrings.count != 0){
        handler(currentSuggestionsStrings);
         dispatch_async(dispatch_get_main_queue(), ^{
            if(textField == self.tfDistinationCity){
                distinationItem = nil;
                [self.actIndicatorDistination stopAnimating];
            }else{
                departureItem = nil;
                [self.actIndicatorDeparture stopAnimating];
            }
         });
    }
}

#pragma
#pragma mark - IBAction Methods
- (IBAction)btnSearchAction:(id)sender {
    [self btnHideKeyBoardAction];
    [self validate];
}

- (IBAction)btnDatePickerAction:(id)sender {
    [self btnHideKeyBoardAction];
    [ActionSheetDatePicker showPickerWithTitle:@"Select Date" datePickerMode:UIDatePickerModeDate selectedDate:currentSelectedDate minimumDate:[NSDate date] maximumDate:nil   doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
        currentSelectedDate = selectedDate;
        [self initData];
        
    } cancelBlock:^(ActionSheetDatePicker *picker) {
        
        
    } origin:self.btnDatePicker];
    
    
}
- (IBAction)btnHideKeyBoardAction  {
    [self.tfDepartureCity resignFirstResponder];
    [self.tfDistinationCity resignFirstResponder];
}
@end
