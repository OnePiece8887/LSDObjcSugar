//
//  UIButton+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LSDObjcSugar)

#pragma mark --普通字符串类型的button
+(UIButton *_Nullable)lsd_buttonWithTitle:(nullable NSString *)title fontSize:(CGFloat)fontSize textColor:(nullable UIColor *)textColor addTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)controlEvent;



#pragma mark -- 属性字符串类型的button
+(UIButton *_Nullable)lsd_AttributeButtonWithTitle:(nullable NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *_Nullable)textColor;
///适用于图片有后缀的
+ (UIButton *_Nullable)lsd_AttributeButtonWithTitle:(nullable NSString *)title fontSize:(CGFloat)fontSize textColor:(nullable UIColor *)textColor imageName:(nullable NSString *)imageName backImageName:(nullable NSString *)backImageName highlightSuffix:(nullable NSString *)highlightSuffix ;
+ (UIButton *_Nullable)lsd_AttributeButtonWithAttributedText:(nullable NSAttributedString *)attributedText imageName:(nullable NSString *)imageName backImageName:(nullable NSString *)backImageName highlightSuffix:(nullable NSString *)highlightSuffix;


@end
