//
//  UITextField+XZExtension.m
//  fmapp
//
//  Created by admin on 2017/9/12.
//  Copyright © 2017年 yk. All rights reserved.
//

#import "UITextField+XZExtension.h"

@implementation UITextField (XZExtension)

+ (instancetype)xz_textFieldWithFrame:(CGRect)frame imgName:(NSString *)imgName placeholder:(NSString *)placeholder delegate:(id)delegate font:(CGFloat)font keyboardType:(UIKeyboardType)keyboardType {
    
    UITextField *textField = [[self alloc] initWithFrame:frame];
    
    CGFloat height = frame.size.height - 10;
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, height, height)];
    img.image = [UIImage imageNamed:imgName];
    img.contentMode = UIViewContentModeCenter;

    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = img;
    
    textField.keyboardType = keyboardType;
    
    textField.placeholder = placeholder;
    
//    textField.layer.masksToBounds = YES;
    textField.layer.cornerRadius = 20;
    
    textField.font = [UIFont systemFontOfSize:font];
    
    textField.delegate = delegate;
    
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

@end
