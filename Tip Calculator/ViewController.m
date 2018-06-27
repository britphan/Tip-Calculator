//
//  ViewController.m
//  Tip Calculator
//
//  Created by Britney Phan on 6/26/18.
//  Copyright © 2018 Britney Phan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *tipsView;
@property (weak, nonatomic) IBOutlet UIView *billView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.mealBillField becomeFirstResponder];
    self.tipsView.hidden=YES;
}
- (IBAction)onTap:(id)sender {
    [self.mealBillField endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    self.tipsView.hidden=NO;
    double bill = [self.mealBillField.text doubleValue];
 
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage =[percentages[self.tipControl.selectedSegmentIndex]doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    self.tipLabel.text=[NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text=[NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditingBegin:(id)sender {
    CGRect tipsFrame = self.tipsView.frame;
    tipsFrame.origin.y += 80;
    [UIView animateWithDuration:0.2 animations:^{
        self.tipsView.frame = tipsFrame;
    }];
    CGRect newFrame = self.billView.frame;
    newFrame.origin.y += 80;
    [UIView animateWithDuration:0.2 animations:^{
        self.billView.frame = newFrame;
    }];
    [UIView animateWithDuration:0.3 animations:^{
        self.tipsView.alpha = 0;
    }];
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billView.frame;
    newFrame.origin.y -= 80;
    [UIView animateWithDuration:0.2 animations:^{
        self.billView.frame = newFrame;
    }];
    CGRect tipsFrame = self.tipsView.frame;
    tipsFrame.origin.y -= 80;
    [UIView animateWithDuration:0.2 animations:^{
        self.tipsView.frame = tipsFrame;
    }];
    [UIView animateWithDuration:0.3 animations:^{
        self.tipsView.alpha = 1;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
