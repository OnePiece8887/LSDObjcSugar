//
//  NSDate+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LSDObjcSugar)

#pragma mark -- 日期的单例对象
///单例格式化对象
+(NSDateFormatter *)lsd_sharedDateFormatter;


#pragma mark -- 日期的处理方法
///将一个date转化为指定的时间格式
+(NSString *)lsd_dateTimeStringWithDate:(NSDate *)date formatter:(NSString *)formatter;

///将一个date转化为时间戳
+(NSString *)lsd_dateTimeStampWithDate:(NSDate *)date;

///字符串转时间戳
+(NSString *)lsd_timeIntervalFromString:(NSString *)string dateFormat:(NSString *)dateFormat;

///将时间戳转化为date
+(NSDate *)lsd_dateWithTimeStamp:(NSString *)timeStamp;

/**
 开始时间到结束时间的时间差
 @param time1 开始时间
 @param time2 结束时间
 @return 时间差描述
 */
+ (NSString*)compareTwoTime:(long long)time1 time2:(long long)time2;




///显示时间的说明(如果是今天,则显示刚刚等.如果不是今年,返回时间的字符串(年月日))
/// 返回日期格式字符串
///
/// 具体格式如下：
///     - 刚刚(一分钟内)
///     - X分钟前(一小时内)
///     - X小时前(当天)
///     - MM-dd HH:mm(一年内)
///     - yyyy-MM-dd HH:mm(更早期)
-(NSString *)lsd_dateDescription;



@end
