//
//  LLYImageBrowse.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/17.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowse.h"
#import "LLYImageBrowseCell.h"

static NSString *cellId = @"LLYImageBrowseCellId";

@interface LLYImageBrowse()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@end
@implementation LLYImageBrowse

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}



-(void)setupView
{
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.itemSize = CGSizeMake(K_ScreenW , K_ScreenH);
    _layout.minimumLineSpacing = 10;
    _layout.minimumInteritemSpacing = 0;
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, K_ScreenW + K_Width(10), K_ScreenH) collectionViewLayout:_layout];
//    设置内容的Inset 图片中间的空隙。
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, K_Width(10));
    _collectionView.showsVerticalScrollIndicator =false;
    _collectionView.showsHorizontalScrollIndicator = false;
    _collectionView.pagingEnabled = YES;
    
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[LLYImageBrowseCell class] forCellWithReuseIdentifier:cellId];
    [_collectionView registerNib:[UINib nibWithNibName:@"LLYImageBrowseCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellId];
    
    [self addSubview:_collectionView];

    UIPageControl *controller = [[UIPageControl alloc] init];
    controller.numberOfPages = self.maxCount;
    controller.currentPage = self.tapIndex;
    controller.backgroundColor = [UIColor redColor];
    controller.frame = CGRectMake(0, K_ScreenH - K_Height(30), K_ScreenW, K_Height(30));
    [self.collectionView addSubview:controller];
//    controller.sd_layout
//    .leftEqualToView(_collectionView)
//    .rightEqualToView(_collectionView)
//    .bottomEqualToView(_collectionView)
//    .heightIs(K_Height(30));
}

-(void)setTapIndex:(NSInteger)tapIndex
{
    _tapIndex = tapIndex;
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.tapIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//    [self.collectionView reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_maxCount) {
        return _maxCount;
    }
    return _maxCount;
}

-(void)setMaxCount:(NSInteger)maxCount
{
    _maxCount = maxCount;
    
    [self.collectionView reloadData];
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLYImageBrowseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
//    cell.backgroundColor = K_RandColor;
    cell.index = indexPath.row;
//    cell.pageViewController.numberOfPages = self.maxCount;
    if (self.getImgUrl) {
        
        [cell.browseImage sd_setImageWithURL:[NSURL URLWithString:self.getImgUrl(indexPath.row)]];
    }
    
    NSLog(@"indexPath.row = %ld",indexPath.row);
    [cell setDisMissView:^{
       
        if (self.imageBrowseViewDismiss) {
            self.imageBrowseViewDismiss();
        }
        
    }];
    
    return cell;
}


 
@end
