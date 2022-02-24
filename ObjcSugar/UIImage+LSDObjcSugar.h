//
//  UIImage+LSDObjcSugar.h
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompletedBlock)(UIImage *newImage);

@interface UIImage (LSDObjcSugar)

#pragma mark -- 类方法
/// 生成指定颜色的一个`点`的图像
///
/// @param color 颜色
///
/// @return 1 * 1 图像
+(UIImage *)lsd_singleDotImageWithColor:(UIColor *)color;


/// 生成指定颜色和尺寸的的图像
/// @param color 颜色
/// @param size 指定尺寸
/// @param isRound 是否切圆
+ (UIImage *)lsd_imageWithColor:(UIColor *)color size:(CGSize)size isRound:(BOOL)isRound;

///裁剪圆形图片的工具方法
+(UIImage *)lsd_imageClipWithImageName:(NSString *)imageName andBoardMargin:(CGFloat)BoardMargin andBackgroundColor:(UIColor *)color;

///截全屏
+(UIImage *)lsd_imageClipScreenWithView:(UIView *)clipView;

/**
 *  返回一张添加水印的图片并保存到document中
 */
+(instancetype)lsd_waterImageWithBackground:(NSString *)bg logo:(NSString *)logo pathComponent:(NSString *)pathComponent;

///拉伸图片
+(UIImage *)lsd_imageStrentchWithImageName:(NSString *)imageName;

#pragma mark -- 对象方法
///图片异步切圆
-(void)lsd_clipRoundImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completedBlock:(CompletedBlock)completedBlock;


///从一个大的图片中 区域截取图片的方法
-(UIImage *)lsd_clipImageWithBigImage:(UIImage *)bigImage andIndex:(NSInteger)index andSmallImageCount:(NSInteger)count;

///截取部分图像
-(UIImage *)lsd_getSubImage:(CGRect)rect;


#pragma mark -- 方向校正方法
///修正方向(人脸识别中使用)
+(UIImage*)lsd_fixOrientation:(UIImage*)aImage;


#pragma mark --压缩图片尺寸和质量
/// 等比例压缩图片 同时压缩图片质量
/// @param image 原图片
/// @param width 指定图片宽度
+ (UIImage *)lsd_imageWithImageSimple:(UIImage *)image scaledToWidth:(CGFloat)width;

/// 压缩图片到指定尺寸 同时压缩图片质量
/// @param image 原图片
/// @param newSize 指定尺寸
+ (UIImage*)lsd_imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;



@end
