//
//  UIView+XZSetUpChildView.h
//  XUXUE

#import <UIKit/UIKit.h>

@interface UIView (XZExtension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
// 坐标
@property (nonatomic, assign) CGPoint origin;
//
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/** 给view添加渐变的边框 */
- (void)xz_addGradientShadowWithBGColor:(UIColor *)color shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity shadowColor:(UIColor *)shadowColor;
@end
