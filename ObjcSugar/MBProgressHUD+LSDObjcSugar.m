//
//  MBProgressHUD+LSDObjcSugar.m
//  LSDNetWorkTools
//
//  Created by ls on 16/6/13.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "MBProgressHUD+LSDObjcSugar.h"
#import "UIColor+LSDObjcSugar.h"
@implementation MBProgressHUD (LSDObjcSugar)

+ (MBProgressHUD *)lsd_showMessag:(NSString *)message{

    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.label.numberOfLines = 0;
    hud.label.font = [UIFont boldSystemFontOfSize:15];
    hud.label.textColor = [UIColor lsd_ColorWithString:@"666666"];
    hud.margin = 7;
    hud.offset = CGPointMake(0.0, -50.0) ;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.0];
    
    return hud;
}

+ (MBProgressHUD *)lsd_showMessag:(NSString *)message textColor:(UIColor *)textColor font:(UIFont *)font margin:(CGFloat)margin offset:(CGPoint)offset{

    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.label.numberOfLines = 0;
    if (font == nil) {
        font = [UIFont boldSystemFontOfSize:15];
    }
    hud.label.font = font;
    hud.label.textColor = textColor;
    hud.margin = margin;
    hud.offset = offset;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.0];
    
    return hud;
}

@end
