//
//  ViewController.m
//  Travel Search
//
//  Created by Yahia Mahrous on 6/12/16.
//  Copyright © 2016 Yahia Mahrous. All rights reserved.
//

#import "ViewController.h"
#import "Travel_Search-Swift.h"
@interface ViewController ()

@end

@implementation ViewController
#pragma
#pragma mark - UITableViewController LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
       [self initViews];
}
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma
#pragma mark - Class Methods
-(void) initViews{
    UIView * bg= [[UIView alloc] initWithFrame:self.view.frame];
    UIImageView * img = [[UIImageView alloc] initWithFrame:self.view.frame];
    img.image = [UIImage imageNamed:@"bg"];
    img.alpha=0.2;
    [bg addSubview:img];
    [self.tableView setBackgroundView:bg];

}
-(void)validate{
    Validator * validator= [[Validator alloc] init];
    validator.delegate = self;
    
    [validator putRule:[Rules checkIfStringIsEmpty:self.tfDepartureCity.text WithFailureString:@"" withView:self.tfDepartureCity]];
    [validator putRule:[Rules checkIfStringIsEmpty:self.tfDistinationCity.text WithFailureString:@"" withView:self.tfDistinationCity]];
    
    [validator putRule:[Rules checkIfStringIsEmpty:self.btnDatePicker.titleLabel.text WithFailureString:@"" withView:self.btnDatePicker]];
    
    [validator validate];
}
#pragma
#pragma mark - ValidatorDelegate Methods

- (void)preValidation{
    
}
- (void)onSuccess
{
    [[DataAccessController sharedInstance] getCities:@"ber" withCompletion:^(NSMutableArray * _Nonnull items, BOOL status) {
        
        
    }];

}
- (void)onFailure:(Rule *)failedRule{
    AFViewShaker * viewShaker= [[AFViewShaker alloc] initWithView:failedRule.view];
    [viewShaker shake];
    failedRule.view.layer.borderWidth = 2;
    failedRule.view.layer.borderColor = [UIColor redColor].CGColor;
    
}
#pragma
#pragma mark - IBAction Methods
- (IBAction)btnSearchAction:(id)sender {
    [self btnHideKeyBoardAction];
    [self validate];
}

- (IBAction)btnDatePickerAction:(id)sender {
    [self btnHideKeyBoardAction];
}
- (IBAction)btnHideKeyBoardAction  {
    [self.tfDepartureCity resignFirstResponder];
    [self.tfDistinationCity resignFirstResponder];
}
@end
