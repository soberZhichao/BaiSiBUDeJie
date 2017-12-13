//
//  KLLabel.h
//  资讯类展示界面
//
//  Created by sober on 2017/12/12.
//  Copyright © 2017年 sober. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VerticalAlignment) {
    KLTextVerticalAlignmentTop      = 0,    // Visually top aligned
    KLTextVerticalAlignmentMiddle      = 1,    // Visually middle aligned
    KLTextVerticalAlignmentBottom      = 2,    // Visually bottom aligned
} NS_ENUM_AVAILABLE_IOS(6_0);

@interface KLLabel : UILabel

@property (nonatomic, assign) VerticalAlignment verticalAlignment;

@end
