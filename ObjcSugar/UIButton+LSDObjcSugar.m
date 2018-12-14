//
//  UIButton+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "UIButton+LSDObjcSugar.h"

@implementation UIButton (LSDObjcSugar)

#pragma mark --普通类型的button
+ (instancetype)lsd_buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix{
    
    UIButton *button = [[self alloc]init];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    
    if (imageName != nil) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [imageName stringByAppendingString:highlightSuffix];
        [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }
    
    if (backImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [backImageName stringByAppendingString:highlightSuffix];
        [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
        
    }
    
    if (backgroundColor != nil) {
        [button setBackgroundColor:backgroundColor];
    }else{
         [button setBackgroundColor:[UIColor whiteColor]];
    }
    
    [button sizeToFit];
    
    return button;
}



#pragma mark -- 属性字符串类型的button
+(instancetype)lsd_buttonWithAttributedText:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor
{

    NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:title attributes:@{
                
                NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                NSForegroundColorAttributeName : textColor
                }];
    
    return [self lsd_buttonWithAttributedText:attributedText imageName:nil backImageName:nil highlightSuffix:nil];

}
+ (instancetype)lsd_buttonWithAttributedText:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix
{
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]
                                          initWithString:title
                                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                                                       NSForegroundColorAttributeName: textColor}];
    
    return [self lsd_buttonWithAttributedText:attributedText imageName:imageName backImageName:backImageName highlightSuffix:highlightSuffix];
}


+ (instancetype)lsd_buttonWithAttributedText:(NSAttributedString *)attributedText imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix
{
    UIButton *button = [[self alloc]init];
    
    [button setAttributedTitle:attributedText forState:UIControlStateNormal];
    
    if (imageName != nil) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [imageName stringByAppendingString:highlightSuffix];
        [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }

    if (backImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [backImageName stringByAppendingString:highlightSuffix];
        [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];

    }
    [button sizeToFit];
    
    return button;
    
}


@end
