//
//  KLTabBar.m
//  资讯类展示界面
//
//  Created by sober on 2017/11/22.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "KLTabBar.h"

@implementation KLTabBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat itemW = self.KL_width / (self.items.count + 1);
    
    int i = 0;
    for (UIControl *subview in self.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            if (i == 2)
            {
                i ++;
            }
            subview.KL_x = i * itemW;
            
            i ++;
        }
    }
    /**
     *  添加发布按钮
     */
    self.publishBtn.center = CGPointMake(self.KL_width * 0.5, self.KL_height * 0.5);

}

- (UIButton *)publishBtn
{
    if (_publishBtn == nil)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        [self addSubview:btn];

        _publishBtn = btn;

    }
    
    return _publishBtn;
}

@end
