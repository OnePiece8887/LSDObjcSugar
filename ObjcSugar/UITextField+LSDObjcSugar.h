//
//  UITextField+LSDObjcSugar.h
//  ZZHAutomation
//
//  Created by 神州锐达 on 2018/11/26.
//  Copyright © 2018 onePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (LSDObjcSugar)

/// 文本输入框
/// @param leftViewMargin 左边间隔
/// @param image 左边图标
-(void)lsd_leftViewMargin:(CGFloat)leftViewMargin image:(nullable UIImage *)image;

@end

NS_ASSUME_NONNULL_END
