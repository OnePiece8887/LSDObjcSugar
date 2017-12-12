//
//  UIResponder+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 2017/11/6.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (LSDObjcSugar)

///通过响应链传值
- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

///通过响应链获取到指定responderClassName的响应者
-(UIResponder *)lsd_returnResponderWithResponderClassName:(NSString *)responderClassName;

@end
