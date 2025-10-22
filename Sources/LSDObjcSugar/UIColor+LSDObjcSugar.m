//
//  UIColor+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "UIColor+LSDObjcSugar.h"

@implementation UIColor (LSDObjcSugar)


+ (UIColor *)lsd_ColorWithString:(NSString *)string{
   
        NSString *cString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        // String should be 6 or 8 characters
        
        if ([cString length] < 6) return [UIColor blackColor];
        // strip 0X if it appears
        if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
        if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
        if ([cString length] != 6) return [UIColor blackColor];
        
        // Separate into r, g, b substrings
        
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        // Scan values
        unsigned int r, g, b;
        NSScanner *scanner;
        scanner = [[NSScanner alloc] initWithString:rString];
        [scanner scanHexInt:&r];
        
        scanner = [[NSScanner alloc] initWithString:gString];
        [scanner scanHexInt:&g];
        
        scanner = [[NSScanner alloc] initWithString:bString];
        
        [scanner scanHexInt:&b];
        
        UIColor *resultColor = [[UIColor alloc] initWithRed:((float) r / 255.0f)
                                                      green:((float) g / 255.0f)
                                                       blue:((float) b / 255.0f)
                                                      alpha:1.0f];
        return resultColor;

}


#pragma mark - 颜色函数
+(instancetype)lsd_ColorWithHex:(uint32_t)Hex{
    
    
    int red = Hex & 0xFF0000 >> 16; //取出红色
    int green = Hex & 0x00FF00 >> 8; //取出绿色
    int blue = Hex & 0x0000FF;//取出蓝色
    
    return [UIColor lsd_colorWithRed:red green:green blue:blue];
    
}

+(instancetype)lsd_colorWithRed:(u_int8_t)red green:(u_int8_t)green blue:(u_int8_t)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}


+(instancetype)lsd_randomColor
{
    u_int8_t red = arc4random_uniform(256);
    u_int8_t green = arc4random_uniform(256);
    u_int8_t blue = arc4random_uniform(256);
    
    return [UIColor lsd_colorWithRed:red green:green blue:blue];


}

#pragma mark - 颜色值
- (u_int8_t)hm_redValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[0] * 255);
}

- (u_int8_t)hm_greenValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[1] * 255);
}

- (u_int8_t)hm_blueValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[2] * 255);
}

- (CGFloat)hm_alphaValue {
    return CGColorGetComponents(self.CGColor)[3];
}


// 获取RGB和Alpha
-(NSArray *)lsd_getRGBWithColor:(UIColor *)color{
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat alpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    return @[@(red), @(green), @(blue), @(alpha)];
}



// 改变UIColor的Alpha
+(UIColor *)lsd_getNewColorWith:(UIColor *)color alpha:(CGFloat)alpha{
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:nil];
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return newColor;
}



@end
