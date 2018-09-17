//
//  UIBarButtonItem+LSDObjcSugar.m
//  SwiftBaseProject
//
//  Created by 神州锐达 on 2018/9/17.
//  Copyright © 2018年 onePiece. All rights reserved.
//

#import "UIBarButtonItem+LSDObjcSugar.h"

@implementation UIBarButtonItem (LSDObjcSugar)

+(instancetype)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font action:(SEL)action{
    
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [titleBtn setTitle:title forState:UIControlStateNormal];
    
    [titleBtn setTitleColor:titleColor forState:UIControlStateNormal];
    titleBtn.titleLabel.font = font;
    
    [titleBtn sizeToFit];
    [titleBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc]initWithCustomView:titleBtn];
    
    return titleItem;
    
}

+(instancetype)itemWithImage:(NSString *)image action:(SEL)action{
   
    UIImage *icon = [UIImage imageNamed:image];
    UIImage *iconImage = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [imageBtn setImage:iconImage forState:UIControlStateNormal];
    
    imageBtn.frame = CGRectMake(0, 0, iconImage.size.width + 15, iconImage.size.height + 15);
    
    [imageBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc]initWithCustomView:imageBtn];
    
    return imageItem;
}


@end
