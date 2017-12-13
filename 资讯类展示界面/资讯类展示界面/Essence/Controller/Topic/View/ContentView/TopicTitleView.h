//
//  TopicTitleView.h
//  资讯类展示界面
//
//  Created by sober on 2017/12/12.
//  Copyright © 2017年 sober. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicTitleView : UIView

@property (nonatomic, copy) NSString *title;

- (void)scrollToChangeViewWithY:(CGFloat)y;
@end
