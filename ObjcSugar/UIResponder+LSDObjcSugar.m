//
//  UIResponder+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 2017/11/6.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "UIResponder+LSDObjcSugar.h"

@implementation UIResponder (LSDObjcSugar)

- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    if (self.nextResponder) {
        [self.nextResponder routeEvent:eventName userInfo:userInfo];
    }
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

@end
