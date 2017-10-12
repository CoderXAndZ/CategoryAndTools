//
//  UITextField+XZExtension.h
//  fmapp
//
//  Created by admin on 2017/9/12.
//  Copyright © 2017年 yk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (XZExtension)

+ (instancetype)xz_textFieldWithFrame:(CGRect)frame imgName:(NSString *)imgName placeholder:(NSString *)placeholder delegate:(id)delegate font:(CGFloat)font keyboardType:(UIKeyboardType)keyboardType;

@end
