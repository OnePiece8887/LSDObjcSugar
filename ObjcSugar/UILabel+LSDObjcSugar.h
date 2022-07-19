//
//  UILabel+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LSDObjcSugar)

/// 实例化 UILabel
///
/// @param text      text
/// @param fontSize  fontSize
/// @param textColor textColor
/// @param textAlignment textAlignment
///
/// @return UILabel
+(instancetype)lsd_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

+(instancetype)lsd_labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
