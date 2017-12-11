//
//  EssenceViewController.m
//  资讯类展示界面
//
//  Created by sober on 2017/11/20.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "EssenceViewController.h"
#import "EssenceDetailViewController.h"
#import "UIBarButtonItem+item.h"
#import "KLTopicViewController.h"
#import "KLAllViewController.h"
#import "KLVideoViewController.h"
#import "KLVoiceViewController.h"
#import "KLPictureViewController.h"
#import "KLWordViewController.h"

#import "TopicBarView.h"
#import "TopicChildView.h"

@interface EssenceViewController ()<UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *topicStringsArr;

@property (weak, nonatomic) IBOutlet TopicBarView *topicBarView;
@property (weak, nonatomic) IBOutlet TopicChildView *topicChildView;

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpNavBar];
    [self setUpTopicBar];
    [self setUpChildView];
    
}

- (void)setUpNavBar
{
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"navigationButtonRandom"] highImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:nil action:nil];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)setUpTopicBar
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.topicBarView.topicStringsArr = @[@"声音", @"全部消息", @"视频", @"图片", @"段子", @"声音", @"全部", @"视频", @"图片", @"段子"];
    __weak typeof(self) weakSelf = self;
    self.topicBarView.titleClickBlock = ^(NSInteger tag){
        [weakSelf addTopicChildView:tag];
        // 滚动下方的滚动视图
        [weakSelf.topicChildView scrollChildViewWithBtnTag:tag];
    };
}

- (void)setUpChildView
{
    [self addTopicChildVC];
    [self addTopicChildView:0];
    
    __weak typeof(self) weakSelf = self;
    self.topicChildView.scrollEndBlock = ^(NSInteger index){
        NSArray *topicScrollViewSubArr = weakSelf.topicBarView.topicBarScrollView.subviews;
        NSMutableArray *topicBtnArr = [NSMutableArray array];
        for (id subview in topicScrollViewSubArr)
        {
            if ([subview isKindOfClass:[UIButton class]])
            {
                [topicBtnArr addObject:subview];
            }
        }
        
        [weakSelf.topicBarView titleClick:topicBtnArr[index]];
        
    };
}

- (void)addTopicChildView:(NSInteger)index
{
    KLTopicViewController *topicVC = self.childViewControllers[index];

    if (topicVC.isViewLoaded) return;
    [self.topicChildView.topicChildCollectionView addSubview:topicVC.view];

    topicVC.view.frame = CGRectMake(self.topicChildView.KL_width * index, 0, self.topicChildView.KL_width, self.topicChildView.KL_height - KL_TabBarH);
}

- (void)addTopicChildVC
{
    [self addChildViewController:[[KLAllViewController alloc] init]];
    [self addChildViewController:[[KLVideoViewController alloc] init]];
    [self addChildViewController:[[KLVoiceViewController alloc] init]];
    [self addChildViewController:[[KLPictureViewController alloc] init]];
    [self addChildViewController:[[KLWordViewController alloc] init]];
    
    [self addChildViewController:[[KLAllViewController alloc] init]];
    [self addChildViewController:[[KLVideoViewController alloc] init]];
    [self addChildViewController:[[KLVoiceViewController alloc] init]];
    [self addChildViewController:[[KLPictureViewController alloc] init]];
    [self addChildViewController:[[KLWordViewController alloc] init]];
    
    self.topicChildView.childVCsArr = self.childViewControllers;
}

#pragma mark - Event
- (void)game
{
    
}

- (void)click
{
    UIViewController *detailVC = [[UIViewController alloc] init];
    detailVC.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
