//
//  UINavigationController+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (LSDObjcSugar)

///添加一个全屏返回拖拽手势
@property(strong,nonatomic)UIPanGestureRecognizer *lsd_panGestureRecognizer;

@end
