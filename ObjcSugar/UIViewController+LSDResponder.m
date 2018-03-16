//
//  UIViewController+LSDResponder.m
//  lingzhijingrui
//
//  Created by 神州锐达 on 2018/2/27.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "UIViewController+LSDResponder.h"

@implementation UIViewController (LSDResponder)
-(UIViewController *)lsd_returnViewControllerWithClassName:(NSString *)className{
    
    for (UIViewController *vc in self.navigationController.childViewControllers) {
        
        if ([vc isKindOfClass:NSClassFromString(className)]) {
            return vc;
        }
        
    }
    
    return nil;
    
}
@end
