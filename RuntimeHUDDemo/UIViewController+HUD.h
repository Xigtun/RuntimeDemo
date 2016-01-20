//
//  UIViewController+HUD.h
//  RuntimeHUDDemo
//
//  Created by chenbin on 16/1/19.
//  Copyright © 2016年 hudDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIViewController (HUD)

- (void)showHud;

- (void)showHudWithMessage:(NSString *)message;

- (void)showDeterminateHudWithMessage:(NSString *)message;

- (void)changeHudProgress:(double)precent;

- (void)hideHud;

- (void)hideHudWithSuccessMessage:(NSString *)message;

- (void)hideHudWithErrorMessage:(NSString *)message;

@end
