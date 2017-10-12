//
//  UIColor+XZExtension.m
//  RongMiGuanJia
//
//  Created by admin on 2017/9/18.
//  Copyright © 2017年 RongTuoJinRong. All rights reserved.
//

#import "UIColor+XZExtension.h"

@implementation UIColor (XZExtension)

/** 16进制颜色转成RGB颜色 */
+ (instancetype)xz_colorWithHex:(NSString *)hexStr {
    
    if('#' != [hexStr characterAtIndex:0])
    {
        hexStr = [NSString stringWithFormat:@"#%@", hexStr];
    }
    
    // check for string length
    assert(7 == hexStr.length || 4 == hexStr.length);
    
    NSString *hex1 = [hexStr substringFromIndex:1];
    
    u_int32_t hex = [self hexValueToUnsigned:hex1];
    
    int red = (hex & 0xFF0000) >> 16;
    int green = (hex & 0x00FF00) >> 8;
    int blue = hex & 0x0000FF;
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

+ (unsigned)hexValueToUnsigned:(NSString *)hexValue
{
    unsigned value = 0;
    
    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];
    
    return value;
}

@end
