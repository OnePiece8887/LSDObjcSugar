//
//  UIResponder+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by 神州锐达 on 2017/11/6.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "UIResponder+LSDObjcSugar.h"

@implementation UIResponder (LSDObjcSugar)

- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [self.nextResponder routeEvent:eventName userInfo:userInfo];
}

@end
