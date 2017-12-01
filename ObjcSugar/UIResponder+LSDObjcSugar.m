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

@end
