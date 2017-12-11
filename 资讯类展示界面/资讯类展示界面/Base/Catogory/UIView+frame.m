//
//  UIView+frame.m
//  资讯类展示界面
//
//  Created by sober on 2017/11/22.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)

- (CGFloat)KL_width
{
    return self.frame.size.width;
}

- (CGFloat)KL_height
{
    return self.frame.size.height;
}

- (CGFloat)KL_x
{
    return self.frame.origin.x;
}

- (CGFloat)KL_y
{
    return self.frame.origin.y;
}

- (CGFloat)KL_centerX
{
    return self.center.x;
}

- (CGFloat)KL_centerY
{
    return self.center.y;
}

- (CGFloat)KL_contentOffsetX
{
    UIScrollView *scrollV = (UIScrollView *)self;
    return scrollV.contentOffset.x;
}

- (CGFloat)KL_contentOffsetY
{
    UIScrollView *scrollV = (UIScrollView *)self;
    return scrollV.contentOffset.y;
}

- (void)setKL_width:(CGFloat)KL_width
{
    CGRect rect = self.frame;
    rect.size.width = KL_width;
    self.frame = rect;
}

- (void)setKL_height:(CGFloat)KL_height
{
    CGRect rect = self.frame;
    rect.size.height = KL_height;
    self.frame = rect;
}

- (void)setKL_x:(CGFloat)KL_x
{
    CGRect rect = self.frame;
    rect.origin.x = KL_x;
    self.frame = rect;
}

- (void)setKL_y:(CGFloat)KL_y
{
    CGRect rect = self.frame;
    rect.origin.y = KL_y;
    self.frame = rect;
}

- (void)setKL_centerX:(CGFloat)KL_centerX
{
    CGPoint rect = self.center;
    rect.x = KL_centerX;
    self.center = rect;
}

- (void)setKL_centerY:(CGFloat)KL_centerY
{
    CGPoint rect = self.center;
    rect.y = KL_centerY;
    self.center = rect;
}

- (void)setKL_ContentOffsetX:(CGFloat)contentOffsetX
{
    if ([self isKindOfClass:[UIScrollView class]])
    {
        UIScrollView *scroll = (UIScrollView *)self;
        CGPoint point = scroll.contentOffset;
        point.x = contentOffsetX;
        scroll.contentOffset = point;
    }
}

- (void)setKL_ContentOffsetY:(CGFloat)contentOffsetY
{
    if ([self isKindOfClass:[UIScrollView class]])
    {
        UIScrollView *scroll = (UIScrollView *)self;
        CGPoint point = scroll.contentOffset;
        point.y = contentOffsetY;
        scroll.contentOffset = point;
    }
}

@end
