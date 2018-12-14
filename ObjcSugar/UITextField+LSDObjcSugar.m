//
//  UITextField+LSDObjcSugar.m
//  ZZHAutomation
//
//  Created by 神州锐达 on 2018/11/26.
//  Copyright © 2018 onePiece. All rights reserved.
//

#import "UITextField+LSDObjcSugar.h"

@implementation UITextField (LSDObjcSugar)

-(void)lsd_leftViewMargin:(CGFloat)leftViewMargin image:(UIImage *)image{
    
    if (image) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, leftViewMargin, self.bounds.size.height)];
        imageView.image = image;
        self.leftView = imageView;
        imageView.contentMode = UIViewContentModeCenter;
    }else{
        self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, leftViewMargin, 0)];
    }
   
    //设置显示模式为永远显示(默认不显示)
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
