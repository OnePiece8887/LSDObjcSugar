//
//  NSBundle+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "NSBundle+LSDObjcSugar.h"

@implementation NSBundle (LSDObjcSugar)

+(NSString *)lsd_currentVerson
{
    return  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

+(UIImage *)lsd_launchImage
{

    NSArray *launchImages = [NSBundle mainBundle].infoDictionary[@"UILaunchImages"];
    NSString *sizeString  = NSStringFromCGSize([UIScreen mainScreen].bounds.size);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"UILaunchImageOrientation = 'Portrait' AND UILaunchImageSize = %@",sizeString];
    
    NSArray *result = [launchImages filteredArrayUsingPredicate:predicate];
    
    NSString *imageName = result.lastObject[@"UILaunchImageName"];
    
    return  [UIImage imageNamed:imageName];
    
}



@end
