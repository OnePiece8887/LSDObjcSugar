//
//  UITextView+LSDObjcSugar.h
//  ManuallySignedTreasure
//
//  Created by 刘帅 on 2025/12/30.
//  Copyright © 2025 河南省信息化集团有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (LSDObjcSugar)
@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;
@end

NS_ASSUME_NONNULL_END
