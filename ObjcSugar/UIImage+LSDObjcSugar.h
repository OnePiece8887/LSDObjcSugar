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
/// @return 1 * 1 图像  纯色图片
+(UIImage *)lsd_singleDotImageWithColor:(UIColor *)color;

///裁剪圆形图片的工具方法
+(UIImage *)lsd_imageClipWithImageName:(NSString *)imageName andBoardMargin:(CGFloat)BoardMargin andBackgroundColor:(UIColor *)color;

///截全屏
+(UIImage *)lsd_imageClipScreenWithView:(UIView *)clipView;

/**
 *  返回一张添加水印的图片并保存到document中
 */
+(UIImage *)lsd_waterImageWithBackground:(NSString *)bg logo:(NSString *)logo pathComponent:(NSString *)pathComponent;

///拉伸图片
+(UIImage *)lsd_imageStrentchWithImageName:(NSString *)imageName;

///从一个大的图片中 区域截取图片的方法
+(UIImage *)lsd_clipImageWithBigImage:(UIImage *)bigImage andIndex:(NSInteger)index andSmallImageCount:(NSInteger)count;

///截图一个view
+(UIImage*)imageFromView:(UIView*)view;

#pragma mark -- 对象方法
///图片异步切圆
-(void)lsd_clipRoundImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completedBlock:(CompletedBlock)completedBlock;


///截取部分图像
-(UIImage *)lsd_getSubImage:(CGRect)rect;


#pragma mark -- 方向校正方法
///修正方向(人脸识别中使用)
+(UIImage*)lsd_fixOrientation:(UIImage*)aImage;

//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;


//图片放大或压缩处理 ，图片放大倍数 0 ~ 2 之间 ，0~1 缩小图片，1~2 放大图片
/**
 *  根据image 返回放大或缩小之后的图片
 *
 *  @param image    原始图片
 *  @param multiple 放大倍数 0 ~ 2 之间
 *
 *  @return 新的image
 */
+ (UIImage *)createNewImageWithColor:(UIImage *)image multiple:(CGFloat)multiple;

@end
