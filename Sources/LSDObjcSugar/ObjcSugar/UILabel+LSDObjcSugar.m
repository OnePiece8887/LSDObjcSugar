//
//  UILabel+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "UILabel+LSDObjcSugar.h"

@implementation UILabel (LSDObjcSugar)

+(instancetype)lsd_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[self alloc]init];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = textAlignment;
    [label sizeToFit];
    return label;
}

+(instancetype)lsd_labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [[self alloc]init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    [label sizeToFit];
    return label;
}

@end
