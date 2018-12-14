//
//  NSDictionary+LSDObjcSugar.m
//  ZZHAutomation
//
//  Created by 神州锐达 on 2018/12/13.
//  Copyright © 2018 onePiece. All rights reserved.
//

#import "NSDictionary+LSDObjcSugar.h"

@implementation NSDictionary (LSDObjcSugar)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM.copy;
}

@end
