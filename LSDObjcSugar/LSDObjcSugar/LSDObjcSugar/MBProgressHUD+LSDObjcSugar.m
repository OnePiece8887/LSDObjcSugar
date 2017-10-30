//
//  MBProgressHUD+LSDObjcSugar.m
//  LSDNetWorkTools
//
//  Created by ls on 16/6/13.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "MBProgressHUD+LSDObjcSugar.h"

@implementation MBProgressHUD (LSDObjcSugar)
+ (MBProgressHUD *)lsd_showMessag:(NSString *)message{

    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    
    // 隐藏时候从父控件中移除
    
    hud.removeFromSuperViewOnHide = YES;
   
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.0];
    
    return hud;
}


@end
