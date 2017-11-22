//
//  KLTabBarController.m
//  资讯类展示界面
//
//  Created by sober on 2017/11/20.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "KLTabBarController.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "PublishViewController.h"
#import "FrendTrendViewController.h"
#import "MeViewController.h"
#import "KLNavigationViewController.h"
#import "KLTabBar.h"

@interface KLTabBarController ()

@end

@implementation KLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     *  子控制器
     */
    [self addChildVC];
    /**
     *  item排布
     */
    [self setUpTabBarStyle];
    /**
     *  item样式
     */
    [self setUpTabBarItemStyle];
}

- (void)setUpTabBarStyle
{
    KLTabBar *tabbar = [[KLTabBar alloc] init];
    [self setValue:tabbar forKey:@"tabBar"];
}

- (void)addChildVC
{
    NSArray *VCNames = @[@"EssenceViewController", @"NewViewController", @"FrendTrendViewController", @"MeViewController"];
    [self setupTabBarVCs:VCNames];
}

- (void)setupTabBarVCs:(NSArray *)VCNames
{
    for (NSString *vcName in VCNames)
    {
        Class VCClass = NSClassFromString(vcName);
        UIViewController *VC = [[VCClass alloc] init];
        KLNavigationViewController *navVC = [[KLNavigationViewController alloc] initWithRootViewController:VC];
        [self addChildViewController:navVC];
    }
}

- (void)setUpTabBarItemStyle
{
    
    NSArray *tabBarTitle = @[@"精华", @"新帖", @"关注", @"我"];
    NSArray *tabBarImage = @[@"tabBar_essence_icon", @"tabBar_new_icon", @"tabBar_friendTrends_icon", @"tabBar_me_icon"];
    NSArray *tabBarImageClick = @[@"tabBar_essence_click_icon", @"tabBar_new_click_icon", @"tabBar_friendTrends_click_icon", @"tabBar_me_click_icon"];
    
    for (int i = 0; i < self.childViewControllers.count; i ++)
    {
        [self setUpTitleStyle:tabBarTitle[i] ChildNavigationVC:self.childViewControllers[i]];
        [self setUpImageStyle:tabBarImage[i] ClickImage:tabBarImageClick[i] ChildNavigationVC:self.childViewControllers[i]];
    }
    
    
    /**
     *  TabBarItem 样式
     */
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[KLTabBarController class]]];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];

    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}

- (void)setUpTitleStyle:(NSString *)tabBarTitle ChildNavigationVC:(KLNavigationViewController *)navVC
{
    navVC.tabBarItem.title = tabBarTitle;
}

- (void)setUpImageStyle:(NSString *)tabBarImage ClickImage:(NSString *)tabBarImageClick ChildNavigationVC:(KLNavigationViewController *)navVC
{
    navVC.tabBarItem.image = [[UIImage imageNamed:tabBarImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVC.tabBarItem.selectedImage = [[UIImage imageNamed:tabBarImageClick] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
