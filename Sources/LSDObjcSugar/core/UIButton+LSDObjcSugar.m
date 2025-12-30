//
//  UIButton+LSDObjcSugar.m
//  LSDObjcSugar
//
//  Created by ls on 16/6/7.
//  Copyright © 2016年 szrd. All rights reserved.
//

#import "UIButton+LSDObjcSugar.h"

@implementation UIButton (LSDObjcSugar)

#pragma mark --普通类型的button
+ (instancetype)lsd_buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix{
    
    UIButton *button = [[self alloc]init];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    
    if (imageName != nil) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [imageName stringByAppendingString:highlightSuffix];
        [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }
    
    if (backImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [backImageName stringByAppendingString:highlightSuffix];
        [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
        
    }
    
    if (backgroundColor != nil) {
        [button setBackgroundColor:backgroundColor];
    }else{
         [button setBackgroundColor:[UIColor whiteColor]];
    }
    
    [button sizeToFit];
    
    return button;
}



#pragma mark -- 属性字符串类型的button
+(instancetype)lsd_buttonWithAttributedText:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor
{

    NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:title attributes:@{
                
                NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                NSForegroundColorAttributeName : textColor
                }];
    
    return [self lsd_buttonWithAttributedText:attributedText imageName:nil backImageName:nil highlightSuffix:nil];

}
+ (instancetype)lsd_buttonWithAttributedText:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix
{
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]
                                          initWithString:title
                                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                                                       NSForegroundColorAttributeName: textColor}];
    
    return [self lsd_buttonWithAttributedText:attributedText imageName:imageName backImageName:backImageName highlightSuffix:highlightSuffix];
}


+ (instancetype)lsd_buttonWithAttributedText:(NSAttributedString *)attributedText imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix
{
    UIButton *button = [[self alloc]init];
    
    [button setAttributedTitle:attributedText forState:UIControlStateNormal];
    
    if (imageName != nil) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [imageName stringByAppendingString:highlightSuffix];
        [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }

    if (backImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [backImageName stringByAppendingString:highlightSuffix];
        [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];

    }
    [button sizeToFit];
    
    return button;
    
}
#pragma mark --icon在title右边
- (void)setImageRightOfTitleWithSpacing:(CGFloat)spacing {
    UIImage *image = self.imageView.image;
    NSString *title = [self titleForState:UIControlStateNormal];
    
    if (!image || !title.length) {
        return;
    }
    
    // 获取图片宽度
    CGFloat imageWidth = image.size.width;
    
    // 获取标题字体（安全 fallback）
    UIFont *titleFont = self.titleLabel.font ?: [UIFont systemFontOfSize:17.0];
    
    // 计算标题宽度
    NSDictionary *attributes = @{ NSFontAttributeName: titleFont };
    CGSize titleSize = [title sizeWithAttributes:attributes];
    CGFloat titleWidth = titleSize.width;
    
    // 设置 contentHorizontalAlignment 为左对齐
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 设置 titleEdgeInsets：向左移动 imageWidth + spacing
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - spacing, 0, imageWidth + spacing);
    
    // 设置 imageEdgeInsets：向右移动 titleWidth + spacing
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + spacing, 0, -titleWidth - spacing);
}
@end
