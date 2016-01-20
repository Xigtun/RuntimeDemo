//
//  ViewController.m
//  RuntimeHUDDemo
//
//  Created by chenbin on 16/1/19.
//  Copyright © 2016年 hudDemo. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+HUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)showOneAction:(id)sender {
    [self showHud];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHud];
    });
}

- (IBAction)showTwoAction:(id)sender {
    [self showHudWithMessage:@"Loading"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHudWithSuccessMessage:@"Success"];
    });
}

- (IBAction)showThreeAction:(id)sender {
    [self showHudWithMessage:@"loading"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHudWithErrorMessage:@"Error"];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
