//
//  UIView+animation.m
//  资讯类展示界面
//
//  Created by sober on 2017/12/7.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "UIView+animation.h"

@implementation UIView (animation)
- (void)scaleAnimationWithName:(NSString *)name From:(CGFloat)x1 To:(CGFloat)x2;
{
    CABasicAnimation *animationBig = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animationBig.fromValue = [NSNumber numberWithFloat:x1];
    animationBig.toValue = [NSNumber numberWithFloat:x2];
    animationBig.duration = 0.3;
    animationBig.repeatCount = 1;
    animationBig.fillMode = kCAFillModeForwards;
    animationBig.removedOnCompletion = NO;
    [self.layer addAnimation:animationBig forKey:name];
}
@end
