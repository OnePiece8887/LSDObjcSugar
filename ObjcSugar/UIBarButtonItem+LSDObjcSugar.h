//
//  UIBarButtonItem+LSDObjcSugar.h
//  SwiftBaseProject
//
//  Created by 神州锐达 on 2018/9/17.
//  Copyright © 2018年 onePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LSDObjcSugar)
//文本
+(instancetype)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font action:(SEL)action;
//图片
+(instancetype)itemWithImage:(NSString *)image action:(nullable SEL)action;

@end
