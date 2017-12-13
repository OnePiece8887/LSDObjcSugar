//
//  NSObject+AssociatedObject.h
//  LSDObjcSugar
//
//  Created by ls on 2017/12/13.
//  Copyright © 2017年 onePiece. All rights reserved.
//

///关联对象
#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObject)

- (id)lsd_getAssociatedValueForKey:(void *)key;

// Association Policy - OBJC_ASSOCIATION_RETAIN_NONATOMIC
- (void)lsd_setAssociatedValue:(id)value withKey:(void *)key;

// Association Policy - OBJC_ASSOCIATION_ASSIGN
- (void)lsd_setAssignValue:(id)value withKey:(SEL)key;

// Association Policy - OBJC_ASSOCIATION_COPY_NONATOMIC
- (void)lsd_setCopyValue:(id)value withKey:(SEL)key;

- (void)lsd_removeAssociatedObjects;

@end
