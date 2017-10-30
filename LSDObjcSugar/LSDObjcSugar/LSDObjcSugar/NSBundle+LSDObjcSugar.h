//
//  NSBundle+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <UIkit/UIKit.h>

@interface NSBundle (LSDObjcSugar)
///获取当前版本号
+(NSString *)lsd_currentVerson;

///与当前屏幕尺寸匹配的启动图像
+(UIImage *)lsd_launchImage;

@end
