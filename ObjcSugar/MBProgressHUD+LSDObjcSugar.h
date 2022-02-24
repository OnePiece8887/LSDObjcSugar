//
//  MBProgressHUD+LSDObjcSugar.h
//  LSDNetWorkTools
//
//  Created by ls on 16/6/13.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (LSDObjcSugar)


/// 提示框
/// @param message 提示信息
+ (MBProgressHUD *)lsd_showMessag:(NSString *)message;

///  提示框
/// @param message 提示信息
/// @param textColor 字体颜色
/// @param font 字体大小
/// @param margin 间隔
/// @param offset 偏移量
+ (MBProgressHUD *)lsd_showMessag:(NSString *)message textColor:(UIColor *)textColor font:(UIFont *)font margin:(CGFloat)margin offset:(CGPoint)offset;

@end
