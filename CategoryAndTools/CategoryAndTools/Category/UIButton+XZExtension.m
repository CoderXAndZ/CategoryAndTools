//
//  UIButton+XZExtension.m
//  RongMiGuanJia
//
//  Created by admin on 2017/9/8.
//  Copyright © 2017年 RongTuoJinRong. All rights reserved.
//

#import "UIButton+XZExtension.h"

@implementation UIButton (XZExtension)
/**
 创建只含有文字的button
 */
+ (instancetype)xz_buttonWithFrame:(CGRect)frame title:(NSString *)title font:(CGFloat)font titleColor:(UIColor *)titleColor highlightColor:(UIColor *)highlightColor taret:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    if (font) {
        [button.titleLabel setFont:[UIFont systemFontOfSize:font]];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }else {
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if (highlightColor) {
        [button setTitleColor:highlightColor forState:UIControlStateHighlighted];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

/**
 创建只有图片的button
 */
+ (instancetype)xz_buttonWithFrame:(CGRect)frame imgName:(NSString *)imgName highlightImgName:(NSString *)highlightImgName taret:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    
    if (highlightImgName) {
        [button setImage:[UIImage imageNamed:highlightImgName] forState:UIControlStateHighlighted];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

/**
 创建既有文字又有图片的button
 */
+ (instancetype)xz_buttonWithFrame:(CGRect)frame title:(NSString *)title font:(CGFloat)font titleColor:(UIColor *)titleColor highlightColor:(UIColor *)highlightColor imgName:(NSString *)imgName highlightImgName:(NSString *)highlightImgName taret:(id)target action:(SEL)action {
    
    UIButton *button = [self xz_buttonWithFrame:frame title:title font:font titleColor:titleColor highlightColor:highlightColor taret:target action:action];
    
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    
    if (highlightImgName) {
        [button setImage:[UIImage imageNamed:highlightImgName] forState:UIControlStateHighlighted];
    }
    return button;
}
@end
