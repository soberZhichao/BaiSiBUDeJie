//
//  TopicBarView.m
//  资讯类展示界面
//
//  Created by sober on 2017/12/8.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "TopicBarView.h"

#define TitleBtnW self.topicBarScrollView.KL_width / 5
#define TitleBtnH self.topicBarScrollView.KL_height

@interface TopicBarView ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIButton *previousClickedBtn;
@property (nonatomic, weak) UIView *underlineView;

@end

@implementation TopicBarView
@synthesize topicStringsArr = _topicStringsArr;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setTopicStringsArr:(NSArray<NSString *> *)topicStringsArr
{
    _topicStringsArr = topicStringsArr;
    
    // topic Bar content
    self.topicBarScrollView.contentSize = CGSizeMake(TitleBtnW * _topicStringsArr.count, self.topicBarScrollView.KL_height);
    
    // add button
    [self addTopicButton:topicStringsArr];
    
    // add line
    [self addUnderLine];

}

- (void)addTopicButton:(NSArray *)topicStringsArr
{
    NSUInteger count = topicStringsArr.count;
    
    for (NSUInteger i = 0; i < count; i++)
    {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.topicBarScrollView addSubview:titleBtn];
        [titleBtn.titleLabel sizeToFit];
        titleBtn.frame = CGRectMake(i * TitleBtnW, 0, TitleBtnW, TitleBtnH);
        [titleBtn setTitle:topicStringsArr[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        titleBtn.tag = KL_ButtonTagBase + i;
        // init previousClickedBtn 并初始化 第一个btn的状态
        if (i == 0)
        {
            self.previousClickedBtn = titleBtn;
            titleBtn.selected = YES;
            [titleBtn scaleAnimationWithName:@"animationBig" From:1.0f To:1.2f];
        }
    }
}

- (void)addUnderLine
{
    /**
     *  取出第一个button，初始化下划线
     */
    NSArray *topicScrollViewSubArr = self.topicBarScrollView.subviews;
    UIButton *topicBtn = nil;
    for (id subview in topicScrollViewSubArr)
    {
        if ([subview isKindOfClass:[UIButton class]])
        {
            topicBtn = subview;
            break;
        }
    }
    
    UIView *underlineView = [[UIView alloc] init];
    [self.topicBarScrollView addSubview:underlineView];
    underlineView.backgroundColor = [topicBtn titleColorForState:UIControlStateSelected];
    [topicBtn.titleLabel sizeToFit]; // 让label根据文字内容计算尺寸--- 需要在设置frame之前
    
    underlineView.KL_height = KL_UnderlineH;
    underlineView.KL_width = topicBtn.titleLabel.KL_width;
    underlineView.KL_y = self.topicBarScrollView.KL_height - KL_UnderlineH;
    underlineView.KL_centerX = topicBtn.KL_centerX;
    
    self.underlineView = underlineView;
    
}

#pragma mark - Event
- (void)titleClick:(UIButton *)btn
{
    if (btn == self.previousClickedBtn) return;
    
    self.previousClickedBtn.selected = NO;// 将上一个btn选中状态置为nil
    btn.selected = YES;
    
    // 缩放动画
    [btn scaleAnimationWithName:@"animationBig" From:1.0f To:1.2f];
    [self.previousClickedBtn scaleAnimationWithName:@"animationNomal" From:1.2f To:1.0f];
    
    // 记录上一个button
    self.previousClickedBtn = btn;
    
    // 移动下划线
    [UIView animateWithDuration:0.25 animations:^{
        self.underlineView.KL_width = btn.titleLabel.KL_width;
        self.underlineView.KL_centerX = btn.KL_centerX;
        
    } completion:^(BOOL finished) {
        self.titleClickBlock(btn.tag - KL_ButtonTagBase);
    }];
    
    // button 偏移
    //计算scrollview偏移量
    [self.topicBarScrollView scrollToMidWithView:btn];
    
}
#pragma mark -


@end
