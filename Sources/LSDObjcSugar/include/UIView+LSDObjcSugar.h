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
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property(assign,nonatomic)CGFloat maxX;
@property(assign,nonatomic)CGFloat minX;
@property(assign,nonatomic)CGFloat maxY;
@property(assign,nonatomic)CGFloat minY;
@property(assign,nonatomic)CGFloat centerX;
@property(assign,nonatomic)CGFloat centerY;

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

#pragma mark --设置边框
-(void)lsd_cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;


@end
