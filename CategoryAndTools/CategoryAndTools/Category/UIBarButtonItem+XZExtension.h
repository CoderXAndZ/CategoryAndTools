//
//  UIBarButtonItem+XZExtension.h
//  XZProject
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XZExtension)
/**
  创建图片item
 */
+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
