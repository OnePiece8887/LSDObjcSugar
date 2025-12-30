//
//  UIButton+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LSDObjcSugar)

#pragma mark --普通类型的button
+ (instancetype)lsd_buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix;

#pragma mark -- 属性字符串类型的button
+(instancetype)lsd_buttonWithAttributedText:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;
///适用于图片有后缀的
+ (instancetype)lsd_buttonWithAttributedText:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix ;

+ (instancetype)lsd_buttonWithAttributedText:(NSAttributedString *)attributedText imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix;

#pragma mark --icon在title右边
- (void)lsd_setImageRightOfTitleWithSpacing:(CGFloat)spacing;
@end
