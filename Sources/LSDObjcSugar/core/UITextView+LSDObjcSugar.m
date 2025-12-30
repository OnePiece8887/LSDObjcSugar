//
//  UITextView+LSDObjcSugar.m
//  ManuallySignedTreasure
//
//  Created by 刘帅 on 2025/12/30.
//  Copyright © 2025 河南省信息化集团有限公司. All rights reserved.
//

#import "UITextView+LSDObjcSugar.h"
#import <objc/runtime.h>

static char kPlaceholderLabelKey;
static char kPlaceholderTextKey;
static char kPlaceholderColorKey;

@implementation UITextView (LSDObjcSugar)
- (void)setPlaceholder:(NSString *)placeholder {
    objc_setAssociatedObject(self, &kPlaceholderTextKey, placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self updatePlaceholderVisibility];
}

- (NSString *)placeholder {
    return objc_getAssociatedObject(self, &kPlaceholderTextKey);
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    objc_setAssociatedObject(self, &kPlaceholderColorKey, placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UILabel *placeholderLabel = [self getPlaceholderLabel];
    placeholderLabel.textColor = placeholderColor ?: [UIColor lightGrayColor];
}

- (UIColor *)placeholderColor {
    UIColor *color = objc_getAssociatedObject(self, &kPlaceholderColorKey);
    return color ?: [UIColor lightGrayColor];
}

- (UILabel *)getPlaceholderLabel {
    UILabel *label = objc_getAssociatedObject(self, &kPlaceholderLabelKey);
    if (!label) {
        label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor clearColor];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.font = self.font ?: [UIFont systemFontOfSize:16];
        label.userInteractionEnabled = NO;
        label.textColor = self.placeholderColor;
        [self addSubview:label];
        
        // 使用 Auto Layout（兼容 iOS 9+）
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [label.topAnchor constraintEqualToAnchor:self.topAnchor constant:8],
            [label.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:4],
            [label.trailingAnchor constraintLessThanOrEqualToAnchor:self.trailingAnchor constant:-4]
        ]];
        
        objc_setAssociatedObject(self, &kPlaceholderLabelKey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return label;
}

- (void)updatePlaceholderVisibility {
    UILabel *label = [self getPlaceholderLabel];
    NSString *text = self.text;
    
    BOOL isEmpty = !text || [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0;
    
    label.text = self.placeholder;
    label.hidden = !isEmpty;
    
    // 更新字体（同步 textView 的 font）
    label.font = self.font ?: [UIFont systemFontOfSize:16];
}

#pragma mark - Method Swizzling for Automatic Update

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(setText:);
        SEL swizzledSelector = @selector(swizzled_setText:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAdd = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAdd) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)swizzled_setText:(NSString *)text {
    [self swizzled_setText:text]; // 调用原始 setText
    [self updatePlaceholderVisibility];
}
@end
