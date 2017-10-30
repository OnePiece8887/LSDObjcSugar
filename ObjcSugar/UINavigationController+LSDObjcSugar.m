//
//  UINavigationController+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "UINavigationController+LSDObjcSugar.h"
#import <objc/runtime.h>

@interface LSDFullScreenPopGestureRecognizerDelegate : NSObject<UIGestureRecognizerDelegate>

///这个对象有一个nav控制器属性
@property(weak,nonatomic)UINavigationController *navgationVC;

@end

@implementation LSDFullScreenPopGestureRecognizerDelegate

///拖拽手势将要执行的时候调用
-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureReconizer{
    
    ///当导航控制器中的栈中的自控制器的个数小于等于1的时候，即为跟控制器时，不可以使用手势
    if (self.navgationVC.viewControllers.count <= 1) {
        return NO;
    }
    ///判断这个导航控制器是否正在执行动画  动画存在时手势不可用
    if ([[self.navgationVC valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    ///计算出当前手势的偏移量
    CGPoint translation = [gestureReconizer translationInView:gestureReconizer.view];
    if (translation.x <= 0) {///说明不可以再往左边拖拽了
        return NO;
    }
    ///手势可用
    return YES;
}

@end


@implementation UINavigationController (LSDObjcSugar)

///运行时加载类的时候调用
+(void)load{
    
    Method originalMethod = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
    Method switchMethod = class_getInstanceMethod([self class], @selector(lsd_pushViewController:animated:));
    ///交换自己的和系统的方法  拦截作用
    method_exchangeImplementations(originalMethod, switchMethod);
    
}
///要交换的方法
- (void)lsd_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    ///判断这个控制中的原生手势的所有手势集合中是否有这个全屏返回手势
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.lsd_panGestureRecognizer]) {
        ///如果没有  则添加一个手势
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.lsd_panGestureRecognizer];
        
        
        ///取出原生系统手势的方法和执行对象  然后将target-action绑定到新的全屏返回手势里
        ///拦截作用
        NSArray *targets = [self.interactivePopGestureRecognizer valueForKey:@"_targets"];
        
        id internalTarget = [targets.firstObject valueForKey:@"_target"];
        
        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
        
        self.lsd_panGestureRecognizer.delegate = [self LSD_fullScreenPopGestureRecognizerDelegate];
        [self.lsd_panGestureRecognizer addTarget:internalTarget action:internalAction];
        
        ///禁用系统的交互手势
        self.interactivePopGestureRecognizer.enabled = NO;
        
    }
    ///如果这个导航控制器中没有这个新的控制器  那么就让他执行系统的正常跳转方法
    if (![self.viewControllers containsObject:viewController]) {
        [self lsd_pushViewController:viewController animated:animated];
    }
    
}

///懒加载
-(LSDFullScreenPopGestureRecognizerDelegate *)LSD_fullScreenPopGestureRecognizerDelegate{
    
    LSDFullScreenPopGestureRecognizerDelegate *delegate = objc_getAssociatedObject(self, _cmd);
    ///判断这个拥有导航控制器的类是否存在
    if (!delegate) {
        delegate = [[LSDFullScreenPopGestureRecognizerDelegate alloc]init];
        
        delegate.navgationVC = self;
        
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    
    return delegate;
    
}

#pragma mark -- 运行时关联属性
///运行时关联对象
-(void)setLsd_panGestureRecognizer:(UIPanGestureRecognizer *)lsd_panGestureRecognizer{
    
    objc_setAssociatedObject(self, _cmd, lsd_panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
///懒加载关联对象
-(UIPanGestureRecognizer *)lsd_panGestureRecognizer{
    
    UIPanGestureRecognizer *panGestureRecognizer = objc_getAssociatedObject(self, _cmd);
    ///如果手势不存在 则创建一个新的手势然后set方法赋值
    if (panGestureRecognizer == nil) {
        panGestureRecognizer = [[UIPanGestureRecognizer alloc]init];
        panGestureRecognizer.maximumNumberOfTouches = 1;
        ///在这里关联对象
        objc_setAssociatedObject(self, _cmd, panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return panGestureRecognizer;
}



@end
