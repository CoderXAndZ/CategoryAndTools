//
//  UIImage+XZExtension.m
//  XZProject
//
//  Created by admin on 2017/8/12.
//  Copyright © 2017年 admin. All rights reserved.
//  异步裁切绘制圆角图形

#import "UIImage+XZExtension.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (XZExtension)

/**
 * 根据当前图像，和指定的尺寸，生成圆角图像并且返回
 * return 圆角图像
 */
- (void)xz_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completed:(void (^)(UIImage *image))completed {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 看程序执行耗时
        NSTimeInterval start = CACurrentMediaTime();
        
        // 1.利用绘图，建立上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        // 2.设置被裁切的部分的填充颜色
        [fillColor setFill];
        UIRectFill(rect);
        
        // 3.利用 贝塞尔路径 实现 裁切 效果
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        [path addClip];
        
        // 4.绘制图像
        [self drawInRect:rect];
        
        // 5.取得结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6.关闭上下文
        UIGraphicsEndImageContext();
        
        XZLog(@"耗时：%f",CACurrentMediaTime() - start);
        
        // 7.使用回调，返回结果
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completed) {
                completed(result);
            }
        });
        
    });

}

/** 图片缩放 */
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

/** 获取LaunchImage中的图片 */
+ (UIImage *)getTheLaunchImage
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    
    NSString *viewOrientation = nil;
    if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait)) {
        viewOrientation = @"Portrait";
    } else {
        viewOrientation = @"Landscape";
    }
    
    
    NSString *launchImage = nil;
    
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImage = dict[@"UILaunchImageName"];
        }
    }
    XZLog(@"\n\n图片名称：--------- %@\n\n",launchImage);
    return [UIImage imageNamed:launchImage];
    
}

/** 图片模糊方法 */
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur {
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    //    CGColorSpaceRelease(colorSpace);//**********
    CGImageRelease(imageRef);
    
    return returnImage;
}

/** 模糊图片方法 */ 
+ (UIImage *)coreBlurImage:(UIImage *)image
            withBlurNumber:(CGFloat)blur {
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage  *inputImage=[CIImage imageWithCGImage:image.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

/**
 // 1.设置被裁切的部分的填充颜色
 [fillColor setFill];
 UIRectFill(rect);
 如果不设置的话，被裁切的部分是黑色的；
 
 // 2.使用CACurrentMediaTime()方法查看程序的耗时,打印结果 ==== 耗时：0.013411
 百分之一秒，程序执行东西的时候应该按纳秒来计算，CPU执行程序应该按纳秒来计算，干一个活就占了百分之一秒，一秒能干好多好多程序呢，所以还是挺浪费时间的，
 在主线程中挺浪费时间的，所以，把耗时的操作放在子线程中。
 
 // 3.如何回调？block。iOS开发中，block最多的用途就是在异步执行完成之后，通过参数回调通知调用方法结果！
 */

@end
