//
//  UIResponder+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by 神州锐达 on 2017/11/6.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (LSDObjcSugar)

- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end