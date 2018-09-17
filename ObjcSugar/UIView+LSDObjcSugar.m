//
//  UIView+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "UIView+LSDObjcSugar.h"

@implementation UIView (LSDObjcSugar)

+(instancetype)lsd_loadXib{
    
    NSString *className = NSStringFromClass(self);
    NSString *xibName = [NSString stringWithFormat:@"%@Xib",className];
    return [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
}

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

///获取当前屏幕中present出来的viewcontroller
- (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}


#pragma mark -- 响应者链条
-(UIResponder *)lsd_returnResponderWithResponderClassName:(NSString *)responderClassName{
    //取出对象下一个响应者
    UIResponder * nextResponder = [self nextResponder];
    
    //获取用户想获得class
    Class needClass = NSClassFromString(responderClassName);
    
    //遍历视图响应链条 获取下一响应者
    while (nextResponder != nil) {
        if ([nextResponder isKindOfClass:needClass]) {
            return nextResponder;
        }
        nextResponder = [nextResponder nextResponder];
    }
    return nil;
}

#pragma mark -- xml输出控件
- (NSString *)lsd_xmlWithViewComponent
{
    if ([self isKindOfClass:[UITableViewCell class]]) return @"";
    // 1.初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2.标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", self.class, NSStringFromCGRect(self.frame)];
    if (!CGPointEqualToPoint(self.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(self.bounds)];
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)self;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3.判断是否要结束
    if (self.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4.遍历所有的子控件
    for (UIView *child in self.subviews) {
        NSString *childXml = [child lsd_xmlWithViewComponent];
        [xml appendString:childXml];
    }
    
    // 5.标签结尾
    [xml appendFormat:@"</%@>", self.class];
    
    return xml;
    
}


- (void)setX:(CGFloat)x
{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setW:(CGFloat)w
{
    CGRect rect = self.frame;
    rect.size.width = w;
    self.frame = rect;
}

- (CGFloat)w
{
    return self.frame.size.width;
}

- (void)setH:(CGFloat)h
{
    CGRect rect = self.frame;
    rect.size.height = h;
    self.frame = rect;
}

- (CGFloat)h
{
    return self.frame.size.height;
}

/** 获取最大x */
- (CGFloat)maxX{
    return self.x + self.w;
}
/** 获取最小x */
- (CGFloat)minX{
    return self.x;
}

/** 获取最大y */
- (CGFloat)maxY{
    return self.y + self.h;
}
/** 获取最小y */
- (CGFloat)minY{
    return self.y;
}

/** 设置最小x,相当于设置x */
- (void)setMinX:(CGFloat)minX{
    self.x = minX;
}

/** 设置最大x */
- (void)setMaxX:(CGFloat)maxX{
    self.x = maxX - self.w;
}

/** 设置最小y,相当于设置y */
- (void)setMinY:(CGFloat)minY{
    self.y = minY;
}

/** 设置最大y */
- (void)setMaxY:(CGFloat)maxY{
    self.y = maxY - self.h;
}

/** 中心的x坐标 */
- (CGFloat)centerX{
    return self.center.x;
}

/** 中心的y坐标 */
- (void)setCenterX:(CGFloat)x{
    self.center = CGPointMake(x, self.center.y);
}

- (CGFloat)centerY{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)y{
    self.center = CGPointMake(self.center.x, y);
}

@end
