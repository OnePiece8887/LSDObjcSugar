//
//  NSArray+LSDObjcSugar.m
//  ZZHAutomation
//
//  Created by 神州锐达 on 2018/12/13.
//  Copyright © 2018 onePiece. All rights reserved.
//

#import "NSArray+LSDObjcSugar.h"

@implementation NSArray (LSDObjcSugar)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM.copy;
}

@end
