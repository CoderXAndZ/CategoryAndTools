//
//  XZAutoHideAlertView.m
//  fmapp
//
//  Created by admin on 2017/8/7.
//  Copyright © 2017年 yk. All rights reserved.
//  自定义2秒钟自动消失的提示框

#import "XZAutoHideAlertView.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define alertWidth (kScreenWidth - (100 / 375.0 * kScreenWidth))

@implementation XZAutoHideAlertView

void ShowAutoHideAlertView(NSString *labelText)
{
    if ([labelText length] <= 0)
    return;
    
    [[XZAutoHideAlertView alloc] initWithText:labelText];
}

- (void)initWithText:(NSString *)text {
    if (self == [super init]) {
        [self setUpAutoHideAlertView:text];
    }
}

- (void)setUpAutoHideAlertView:(NSString *)text {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    
//    CGFloat width = screenWidth - (100 / 375.0 * screenWidth);
    
    CGFloat height = [self getStringCGSizeWithMaxSize:CGSizeMake(alertWidth, MAXFLOAT) WithFont:[UIFont systemFontOfSize:15.0f] text:text].height + 20;
    if (height < 50) {
        height = 50;
    }
    
    UILabel *labelAlert = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, alertWidth, height)];
    [self addSubview:labelAlert];
    labelAlert.center = window.center;
    labelAlert.numberOfLines = 0;
    labelAlert.textAlignment = NSTextAlignmentCenter;
    labelAlert.font = [UIFont systemFontOfSize:15.0f];
    labelAlert.textColor = [UIColor whiteColor];
    labelAlert.backgroundColor = [UIColor blackColor];
    labelAlert.layer.masksToBounds = YES;
    labelAlert.layer.cornerRadius = 5.0;
    labelAlert.alpha = 0.9;
    labelAlert.text = text;
    
    [self performSelector:@selector(hideDelayed) withObject:[NSNumber numberWithBool:YES] afterDelay:2.0];
}

- (void)hideDelayed {
    [self removeFromSuperview];
}

- (CGSize)getStringCGSizeWithMaxSize:(CGSize)maxSize WithFont:(UIFont *)font text:(NSString *)text
{
    NSDictionary *attres = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attres context:nil].size;
}

@end
