//
//  UIView+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LSDObjcSugar)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat w;
@property (assign, nonatomic) CGFloat h;

///加载xib视图
+(instancetype)lsd_loadXib;


///通过响应链获取到指定responderClassName的响应者
-(UIResponder *)lsd_returnResponderWithResponderClassName:(NSString *)responderClassName;

///获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC;

///获取当前屏幕中present出来的viewcontroller
- (UIViewController *)getPresentedViewController;

#pragma mark -- xml输出控件
///xml输出控件(调试用)
- (NSString *)lsd_xmlWithViewComponent;


@end
