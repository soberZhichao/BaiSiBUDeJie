//
//  UIScrollView+category.m
//  资讯类展示界面
//
//  Created by sober on 2017/12/11.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "UIScrollView+category.h"

@implementation UIScrollView (category)

- (void)scrollToMidWithView:(UIView *)view
{
    CGFloat originX = view.center.x - CGRectGetMidX(self.frame);
    CGFloat maxOffsetX = self.contentSize.width - self.frame.size.width;
    if (originX < 0) {// 小于中间
        originX = 0;
    }else if (originX > maxOffsetX){// 大于最大偏移
        originX = maxOffsetX;
    }
    [self setContentOffset:CGPointMake(originX, 0) animated:YES];
}

@end
