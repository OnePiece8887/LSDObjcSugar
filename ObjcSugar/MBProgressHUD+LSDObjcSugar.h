//
//  MBProgressHUD+LSDObjcSugar.h
//  LSDNetWorkTools
//
//  Created by ls on 16/6/13.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (LSDObjcSugar)

/**
 提示框
 @param message 信息
 @return 提示框
 */
+ (MBProgressHUD *)lsd_showMessag:(NSString *)message;


@end
