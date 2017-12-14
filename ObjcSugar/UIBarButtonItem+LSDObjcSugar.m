//
//  UIBarButtonItem+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by 神州锐达 on 2017/12/14.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "UIBarButtonItem+LSDObjcSugar.h"
#import "UIView+LSDObjcSugar.h"
@implementation UIBarButtonItem (LSDObjcSugar)

+ (instancetype)lsd_itemWithImage:(NSString *)image hightLImage:(NSString *)hightLImage target:(id)target action:(SEL)action
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightLImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
    
}

+ (instancetype)lsd_itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button sizeToFit];
    
    return [[self alloc] initWithCustomView:button];
    
}



@end
