//
//  UIBarButtonItem+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by 神州锐达 on 2017/12/14.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LSDObjcSugar)

+ (instancetype)lsd_itemWithImage:(NSString *)image hightLImage:(NSString *)hightLImage target:(id)target action:(SEL)action;

+ (instancetype)lsd_itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

@end
