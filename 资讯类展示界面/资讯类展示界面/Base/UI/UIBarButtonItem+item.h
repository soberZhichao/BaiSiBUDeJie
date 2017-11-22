//
//  UIBarButtonItem+item.h
//  资讯类展示界面
//
//  Created by sober on 2017/11/21.
//  Copyright © 2017年 sober. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)

+ (UIBarButtonItem *)backItemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title;

@end
