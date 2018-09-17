//
//  UIFont+LSDObjcSuger.m
//  SampleProject
//
//  Created by 神州锐达 on 2018/7/26.
//  Copyright © 2018年 onePiece. All rights reserved.
//

#import "UIFont+LSDObjcSuger.h"

@implementation UIFont (LSDObjcSuger)
//PX转化为UIFont字号
+(CGFloat)lsd_pxSizeConvert:(CGFloat)pxSize{
    NSNumber *iosFontSize = [NSNumber numberWithFloat:pxSize/96*72];
    CGFloat size = [iosFontSize floatValue];
    return size;
}

@end
