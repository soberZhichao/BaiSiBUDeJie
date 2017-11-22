//
//  KLNavigationViewController.m
//  资讯类展示界面
//
//  Created by sober on 2017/11/20.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "KLNavigationViewController.h"
#import "UIBarButtonItem+item.h"

@interface KLNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation KLNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];

    self.view.backgroundColor = [UIColor whiteColor];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /**
         *  获取系统原始手势的view，并把手势关闭
         */
        UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
        gesture.enabled = NO;
        
        /**
         *  获取手势的target数组
         */
        NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
        
        /**
         *   获取他的唯一的对象，我们知道他是一个叫UIGestureRecognizerTarget的自由类，他有个属性叫_target
         */
        id gestureRecognizerTarget = [_targets firstObject];
        
        /**
         *  获取_target:_UINavigationInteractiveTransition, 它有个方法叫handleNavigationTransition:
         */
        id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
        
        SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
        
        [pan addTarget:navigationInteractiveTransition action:handleTransition];
    });
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *item = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
        viewController.navigationItem.leftBarButtonItem = item;
    }
    [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    /**
     *  两个条件不允许手势执行：1、当前控制器为根控制器  2、Push或者Pop动画正在执行（私有属性）
     *
     *  @return Yes为允许手势起作用
     */
    return self.childViewControllers.count > 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
