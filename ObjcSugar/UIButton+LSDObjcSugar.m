//
//  UIButton+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "UIButton+LSDObjcSugar.h"

@implementation UIButton (LSDObjcSugar)

#pragma mark --普通字符串类型的button
+(UIButton *)lsd_buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor addTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)controlEvent{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn addTarget:target action:action forControlEvents:controlEvent];
    
    return btn;
    
}


#pragma mark -- 属性字符串类型的button
+(UIButton *)lsd_AttributeButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor
{

    NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:title attributes:@{
                
                NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                NSForegroundColorAttributeName : textColor
                }];
    
    return [self lsd_AttributeButtonWithAttributedText:attributedText imageName:nil backImageName:nil highlightSuffix:nil];

}
+ (UIButton *)lsd_AttributeButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix
{
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]
                                          initWithString:title
                                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                                                       NSForegroundColorAttributeName: textColor}];
    
    return [self lsd_AttributeButtonWithAttributedText:attributedText imageName:imageName backImageName:backImageName highlightSuffix:highlightSuffix];
}


+ (UIButton *)lsd_AttributeButtonWithAttributedText:(NSAttributedString *)attributedText imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix
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
