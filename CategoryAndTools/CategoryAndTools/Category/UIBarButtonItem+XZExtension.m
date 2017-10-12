//
//  UIBarButtonItem+XZExtension.m
//  XZProject
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "UIBarButtonItem+XZExtension.h"

@implementation UIBarButtonItem (XZExtension)
/**
 创建图片item
 */
+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage {
    UIButton *button = [UIButton xz_buttonWithFrame:CGRectZero imgName:image highlightImgName:highImage taret:target action:action];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}
@end
