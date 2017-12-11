//
//  TopicBarView.h
//  资讯类展示界面
//
//  Created by sober on 2017/12/8.
//  Copyright © 2017年 sober. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicBarView : UIView
@property (nonatomic, strong) NSArray<NSString *> *topicStringsArr;
@property (weak, nonatomic) IBOutlet UIScrollView *topicBarScrollView;

@property (nonatomic, copy) void (^titleClickBlock)(NSInteger tag);

- (void)titleClick:(UIButton *)btn;

@end
