//
//  NSDate+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "NSDate+LSDObjcSugar.h"

@implementation NSDate (LSDObjcSugar)
#pragma mark -- 日期对象单例

static NSDateFormatter *_dateFormatter;
+(NSDateFormatter *)lsd_sharedDateFormatter
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_dateFormatter == nil) {
            _dateFormatter = [[NSDateFormatter alloc]init];
            _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
        }
    });
    
    return _dateFormatter;
}

#pragma mark -- 日期的处理
+(NSString *)lsd_dateTimeStringWithDate:(NSDate *)date formatter:(NSString *)formatter{

    if (date == nil) {
        date = [NSDate date];
    }
    
    if (formatter == nil) {
        formatter = @"yyyy-MM-dd HH:mm:ss";
    }
    
    [NSDate lsd_sharedDateFormatter].dateFormat = formatter;
    
    NSString *TimeString = [[NSDate lsd_sharedDateFormatter] stringFromDate:date];
    
    return TimeString;
}


+(NSString *)lsd_dateTimeStampWithDate:(NSDate *)date{

    if (date == nil) {
        date = [NSDate date];
    }

    NSString *timeStamp = [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
    return timeStamp;
}



+(NSDate *)lsd_dateWithTimeStamp:(NSString *)timeStamp
{
    return [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    
}

+(NSString *)lsd_timeIntervalFromString:(NSString *)string dateFormat:(NSString *)dateFormat{
    [NSDate lsd_sharedDateFormatter].dateFormat = dateFormat;
    NSDate *date =  [[NSDate lsd_sharedDateFormatter] dateFromString:string];
    NSString *str =  [self lsd_dateTimeStampWithDate:date];
    return str;
}

-(NSString *)lsd_dateDescription
{

    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSCalendar  *calendar = [NSCalendar currentCalendar];
    
    ///要对比的日期
    NSDateComponents *dateComponents = [calendar components:units fromDate:self];
    ///现在当前的日期
    NSDateComponents *currentComponents = [calendar components:units fromDate:[NSDate date]];
    
    ///距离现在的时间差
    NSInteger delta = (NSInteger)[[NSDate date] timeIntervalSinceDate:self];

    
    /// 今天
    if (dateComponents.year == currentComponents.year && dateComponents.month == currentComponents.month && dateComponents.day == currentComponents.day) {
        
        if (delta < 60) {
            return  @"刚刚!";
        }
        
        if (delta < 3600) {
            return  [NSString stringWithFormat:@"%zd 分钟前", delta / 60];
        }
        
        return [NSString stringWithFormat:@"%zd 小时前", delta / 3600];
        
    }else{
    
        if (dateComponents.year != currentComponents.year) {
            NSString *format = @"MM-dd HH:mm";
            format = [@"yyyy-" stringByAppendingString:format];
            [NSDate lsd_sharedDateFormatter].dateFormat = format;
            
            return  [[NSDate lsd_sharedDateFormatter] stringFromDate:self];
        }else{
            
            if (dateComponents.month != currentComponents.month) {
                 return [NSString stringWithFormat:@"%zd月前", delta / 3600/24/30];
            }else{
                    if (delta / 3600/24 == 0) {
                    return @"昨天";
                }else{
                    
                    return [NSString stringWithFormat:@"%zd天前", delta / 3600/24];
                }
                
                
            }
            
        }
    }
}


/**
 开始时间到结束时间的时间差
 @param time1 开始时间
 @param time2 结束时间
 @return 时间差描述
 */
+ (NSString*)compareTwoTime:(long long)time1 time2:(long long)time2
{
    
    int balance = (int)(time2 - time1) ;
    
    NSMutableString *timeString = [[NSMutableString alloc]init];
    
    int sec = balance%60;
    int day = balance/60/60/24;
    int hour = (balance - day*3600*24 - sec)/60/60;
    int min = (balance - day*3600*24 -sec - hour*3600)/60;
    
    if (day != 0) {
        [timeString appendFormat:@"%zd天",day];
    }
    if (hour != 0) {
        [timeString appendFormat:@"%zd小时",hour];
    }
    if (min != 0) {
        [timeString appendFormat:@"%zd分钟",min];
    }
    if (sec != 0) {
        [timeString appendFormat:@"%zd秒",sec];
    }
    
    return timeString;
    
}


@end






















