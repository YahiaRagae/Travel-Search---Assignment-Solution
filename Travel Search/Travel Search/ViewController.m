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
#pragma
#pragma mark - IBAction Methods
- (IBAction)btnSearchAction:(id)sender {
    [[DataAccessController sharedInstance] getCities:@"ber" withCompletion:^(NSMutableArray * _Nonnull items, BOOL status) {
        
        
    }];

}

- (IBAction)btnDatePickerAction:(id)sender {
}
- (IBAction)btnHideKeyBoardAction:(id)sender {
    [self.tfDepartureCity resignFirstResponder];
    [self.tfDistinationCity resignFirstResponder];
}
@end
