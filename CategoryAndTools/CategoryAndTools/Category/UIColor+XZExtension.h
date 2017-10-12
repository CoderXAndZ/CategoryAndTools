//
//  UIColor+XZExtension.h
//  RongMiGuanJia
//
//  Created by admin on 2017/9/18.
//  Copyright © 2017年 RongTuoJinRong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XZExtension)
/** 16进制颜色转成RGB颜色 */
+ (instancetype)xz_colorWithHex:(NSString *)hexStr;

@end
