//
//  UIView+frame.h
//  资讯类展示界面
//
//  Created by sober on 2017/11/22.
//  Copyright © 2017年 sober. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)

/**
 *  view width
 */
@property (nonatomic, assign) CGFloat KL_width;
/**
 *  view height
 */
@property (nonatomic, assign) CGFloat KL_height;
/**
 *  view x
 */
@property (nonatomic, assign) CGFloat KL_x;
/**
 *  view y
 */
@property (nonatomic, assign) CGFloat KL_y;
/**
 *  view CenterX
 */
@property (nonatomic, assign) CGFloat KL_centerX;
/**
 *  view CenterY
 */
@property (nonatomic, assign) CGFloat KL_centerY;

@end
