//
//  TopicTitleView.m
//  资讯类展示界面
//
//  Created by sober on 2017/12/12.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "TopicTitleView.h"
#import "KLLabel.h"

#define TITLELABELFONT 40
@interface TopicTitleView ()

@property (nonatomic, weak) KLLabel *titleLabel;

@end

@implementation TopicTitleView
@synthesize title = _title;

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    KLLabel *titleLabel = [[KLLabel alloc] init];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.offset(0);
    }];
    
    titleLabel.backgroundColor = [UIColor blueColor];
    self.titleLabel = titleLabel;
    self.titleLabel.text = title;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:TITLELABELFONT];
    self.titleLabel.verticalAlignment = KLTextVerticalAlignmentBottom;
    
    self.backgroundColor = [UIColor redColor];
}

- (void)scrollToChangeViewWithY:(CGFloat)y
{
    CGFloat baseY = KL_TopicBarH + KL_TopicTitleViewH;
    if (y < -130 && y >= - baseY)
    {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:TITLELABELFONT - (y + baseY) / 2];
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(KL_TopicTitleViewH));
        }];
    }else if (y > -130 || y < -baseY)
    {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(KL_TopicTitleViewH + (y + baseY)));
        }];
    }
}

@end
