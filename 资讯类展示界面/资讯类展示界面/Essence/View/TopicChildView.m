//
//  TopicChildView.m
//  资讯类展示界面
//
//  Created by sober on 2017/12/8.
//  Copyright © 2017年 sober. All rights reserved.
//

#import "TopicChildView.h"

@interface TopicChildView()<UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>


@end

@implementation TopicChildView
- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.bounds.size;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.topicChildCollectionView.collectionViewLayout = layout;
    self.topicChildCollectionView.pagingEnabled = YES;
    [self.topicChildCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"topicChildCell"];
    self.topicChildCollectionView.contentSize = CGSizeMake(self.KL_width * self.childVCsArr.count, self.KL_height);
}

- (void)scrollChildViewWithBtnTag:(NSInteger)tag
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:tag inSection:0];
    [self.topicChildCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

#pragma mark - scroll delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger index = scrollView.contentOffset.x / scrollView.KL_width;
    
    self.scrollEndBlock(index);
    
}

#pragma mark - collection datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childVCsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topicChildCell" forIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:0.8];;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Func;
}

#pragma mark - observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"])
    {
        CGFloat offsetX = [change[@"new"] CGPointValue].x;
        
        // 字体颜色渐变
        // 下划线位移
        // topicBar 如果只有五个则contentoffset不发生变化，如果大于5个，发生变化
        
        //        self.topicBarCollectionView.KL_contentOffsetX = offsetX;
    }
}
@end
