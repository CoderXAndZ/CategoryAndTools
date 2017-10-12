//
//  UIImage+XZExtension.h
//  XZProject
//
//  Created by admin on 2017/8/12.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZExtension)

/**
 * 根据当前图像，和指定的尺寸，生成圆角图像并且返回
 * return 圆角图像
 */
- (void)xz_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completed:(void (^)(UIImage *image))completed;

/** 获取LaunchImage中的图片 */
+ (UIImage *)getTheLaunchImage;

/** 图片缩放 */
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

/** 图片模糊方法 */
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur

/** 模糊图片方法 */
+ (UIImage *)coreBlurImage:(UIImage *)image
            withBlurNumber:(CGFloat)blur;
@end
