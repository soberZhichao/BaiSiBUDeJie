//
//  KLLabel.m
//  资讯类展示界面
//
//  Created by sober on 2017/12/12.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "KLLabel.h"

@implementation KLLabel
@synthesize verticalAlignment = _verticalAlignment;

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment
{
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

- (void)drawTextInRect:(CGRect)rect
{
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];// 获取文字的rect
    textRect = CGRectMake(bounds.origin.x, textRect.origin.y, bounds.size.width, textRect.size.height);// 微调
    
    switch (self.verticalAlignment) {
        case KLTextVerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case KLTextVerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case KLTextVerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
            break;
    }

    return textRect;
}
@end
