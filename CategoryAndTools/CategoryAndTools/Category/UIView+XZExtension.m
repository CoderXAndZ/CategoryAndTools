//
//  UIView+XZExtension.m
//  XUXUE.


#import "UIView+XZExtension.h"

@implementation UIView (XZExtension)       
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)x{
    return self.frame.origin.x;
}
- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size{
    return self.frame.size;
}
- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin{
    return self.frame.origin;
}
- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY
{
    return self.center.y;
}

/** 给view添加渐变的边框 */
- (void)xz_addGradientShadowWithBGColor:(UIColor *)color shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity shadowColor:(UIColor *)shadowColor {
    self.backgroundColor = color;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowColor = shadowColor.CGColor;
}
@end
