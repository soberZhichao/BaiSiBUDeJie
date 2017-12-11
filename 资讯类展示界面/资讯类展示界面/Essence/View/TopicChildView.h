//
//  TopicChildView.h
//  资讯类展示界面
//
//  Created by sober on 2017/12/8.
//  Copyright © 2017年 sober. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicChildView : UIView
@property (nonatomic, copy) void (^scrollEndBlock)(NSInteger index);
@property (weak, nonatomic) IBOutlet UICollectionView *topicChildCollectionView;
@property (nonatomic, strong) NSArray *childVCsArr;

- (void)scrollChildViewWithBtnTag:(NSInteger)tag;
@end
