//
//  NSObject+AssociatedObject.m
//  LSDObjcSugar
//
//  Created by ls on 2017/12/13.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import  <objc/runtime.h>

@implementation NSObject (AssociatedObject)

- (id)lsd_getAssociatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

// Association Policy - OBJC_ASSOCIATION_RETAIN_NONATOMIC
- (void)lsd_setAssociatedValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Association Policy - OBJC_ASSOCIATION_ASSIGN
- (void)lsd_setAssignValue:(id)value withKey:(SEL)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

// Association Policy - OBJC_ASSOCIATION_COPY_NONATOMIC
- (void)lsd_setCopyValue:(id)value withKey:(SEL)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)lsd_removeAssociatedObjects {
    objc_removeAssociatedObjects(self);
}

@end
