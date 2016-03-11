//
//  UIViewController+HUD.m
//  RuntimeHUDDemo
//
//  Created by chenbin on 16/1/19.
//  Copyright © 2016年 hudDemo. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <objc/runtime.h>

@interface UIViewController(HUD_Private)

@property (nonatomic, strong) MBProgressHUD *progressHud;

@end

@implementation UIViewController (HUD)
const char *kHudKey = "ProgressHUD_Key";

#pragma mark - Public
- (void)showHud
{
    [self showHudWithMessage:nil model:MBProgressHUDModeIndeterminate];
}

- (void)showHudWithMessage:(NSString *)message
{
    [self showHudWithMessage:message model:MBProgressHUDModeIndeterminate];
}

- (void)showDeterminateHudWithMessage:(NSString *)message
{
    [self showHudWithMessage:message model:MBProgressHUDModeDeterminate];
}

- (void)changeHudProgress:(double)precent
{
    self.progressHud.progress = precent;
}

- (void)hideHud
{
    if (!self.progressHud.taskInProgress) {
        return;
    }
    self.progressHud.taskInProgress = NO;
    [self.progressHud hide:YES];
    self.progressHud = nil;
}

- (void)hideHudWithSuccessMessage:(NSString *)message
{
    UIImage *image = [UIImage imageNamed:@"37x-Checkmark"];
    [self hideHudWithMessage:message image:image];
}

- (void)hideHudWithErrorMessage:(NSString *)message
{
    UIImage *image = [UIImage imageNamed:@"error"];
    [self hideHudWithMessage:message image:image];
}

#pragma mark - Private
- (void)showHudWithMessage:(NSString *)message model:(MBProgressHUDMode)mode
{
    if (self.progressHud.taskInProgress) {
        return;
    }
    
    self.progressHud.taskInProgress = YES;
    self.progressHud.mode = mode ?: MBProgressHUDModeIndeterminate;
    self.progressHud.labelText = message;
    self.progressHud.labelFont = [UIFont systemFontOfSize:15];
    [self.progressHud show:YES];
    [self.progressHud hide:YES afterDelay:15];
}

- (void)hideHudWithMessage:(NSString *)message image:(UIImage *)image
{
    self.progressHud.customView = [[UIImageView alloc] initWithImage:image];
    self.progressHud.mode = MBProgressHUDModeCustomView;
    self.progressHud.labelText = message;
    self.progressHud.labelFont = [UIFont systemFontOfSize:15];
    
    [self.progressHud show:YES];
    [self performSelector:@selector(hideHud) withObject:nil afterDelay:0.7];
}

#pragma mark - setter & getter
- (void)setProgressHud:(MBProgressHUD *)progressHud
{
    objc_setAssociatedObject(self, kHudKey, progressHud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)progressHud
{
    MBProgressHUD *hud = objc_getAssociatedObject(self, kHudKey);
    if (!hud) {
        UIView *hudSuperView = self.view;
        hud = [[MBProgressHUD alloc] initWithView:hudSuperView];
        hud.removeFromSuperViewOnHide = YES;
        [hudSuperView addSubview:hud];
        self.progressHud = hud;
    }
    return hud;
}

@end
