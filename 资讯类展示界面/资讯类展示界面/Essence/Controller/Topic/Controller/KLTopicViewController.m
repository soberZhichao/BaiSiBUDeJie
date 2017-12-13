//
//  KLTopicViewController.m
//  资讯类展示界面
//
//  Created by sober on 2017/11/23.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "KLTopicViewController.h"
#import "KLOnlyTextTableViewCell.h"
#import "TopicTitleView.h"

@interface KLTopicViewController ()
@property (nonatomic, strong) TopicTitleView *topicTitleView;

@end

@implementation KLTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitleView];
    [self setUpCommonTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)setTitleView
{
    TopicTitleView *topicTitleView = [[TopicTitleView alloc] init];
    [self.tableView addSubview:topicTitleView];
    [topicTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(-(KL_TopicTitleViewH + KL_TopicBarH));
        make.width.equalTo(@(KL_SCREENW));
        make.height.equalTo(@(KL_TopicTitleViewH));
    }];
    
    topicTitleView.title = @"首页";
    self.topicTitleView = topicTitleView;
    
}

- (void)setUpCommonTableView
{
    [self.tableView registerClass:[KLOnlyTextTableViewCell class] forCellReuseIdentifier:@"KLOnlyTextTableViewCell"];
    self.tableView.contentInset = UIEdgeInsetsMake(KL_TopicBarH + KL_TopicTitleViewH - 20, 0, 0, 0);// 在navigationVC下 bar 隐藏，contentInset依然会计算statusBar，
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.showsVerticalScrollIndicator = YES;
    self.tableView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KLOnlyTextTableViewCell"];
    cell.textLabel.text = @"你在看我吗~";
//    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%f %f %f %f", self.topicTitleView.KL_x, self.topicTitleView.KL_y, self.topicTitleView.KL_width, self.topicTitleView.KL_height);
    Func
}

#pragma mark - scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollView.contentOffset.y~~~~~~%f", scrollView.contentOffset.y);
    [self.topicTitleView scrollToChangeViewWithY:scrollView.contentOffset.y];
}
@end
