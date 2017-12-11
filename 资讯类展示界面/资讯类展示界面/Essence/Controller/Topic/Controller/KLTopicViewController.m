//
//  KLTopicViewController.m
//  资讯类展示界面
//
//  Created by sober on 2017/11/23.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "KLTopicViewController.h"
#import "KLOnlyTextTableViewCell.h"

@interface KLTopicViewController ()

@end

@implementation KLTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpCommonTableView];
}

- (void)setUpCommonTableView
{
    [self.tableView registerClass:[KLOnlyTextTableViewCell class] forCellReuseIdentifier:@"KLOnlyTextTableViewCell"];
    self.tableView.contentInset = UIEdgeInsetsMake(KL_TopicBarH, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KLOnlyTextTableViewCell"];
    cell.textLabel.text = @"你在看我吗~";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Func
}


@end
