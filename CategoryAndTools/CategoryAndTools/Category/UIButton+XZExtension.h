//
//  UIButton+XZExtension.h
//  RongMiGuanJia
//
//  Created by admin on 2017/9/8.
//  Copyright © 2017年 RongTuoJinRong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XZExtension)
/**
 创建只含有文字的button
 */
+ (instancetype)xz_buttonWithFrame:(CGRect)frame title:(NSString *)title font:(CGFloat)font titleColor:(UIColor *)titleColor highlightColor:(UIColor *)highlightColor taret:(id)target action:(SEL)action;

/**
 创建只有图片的button
 */
+ (instancetype)xz_buttonWithFrame:(CGRect)frame imgName:(NSString *)imgName highlightImgName:(NSString *)highlightImgName taret:(id)target action:(SEL)action;

/**
 创建既有文字又有图片的button
 */
+ (instancetype)xz_buttonWithFrame:(CGRect)frame title:(NSString *)title font:(CGFloat)font titleColor:(UIColor *)titleColor highlightColor:(UIColor *)highlightColor imgName:(NSString *)imgName highlightImgName:(NSString *)highlightImgName taret:(id)target action:(SEL)action;

@end
