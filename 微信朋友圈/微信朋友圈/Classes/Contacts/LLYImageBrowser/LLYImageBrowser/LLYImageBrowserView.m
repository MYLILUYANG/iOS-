//
//  LLYImageBrowserView.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowserView.h"
#import "LLYImageModel.h"
#import "LLYImageBrowserViewCell.h"

static NSString *LLYImageBrowserViewCellIdentifier = @"LLYImageBrowserViewCellIdentifier";

@interface LLYImageBrowserView()<LLYImageBrowserViewDelegate>

@end

@implementation LLYImageBrowserView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    if (self =  [super initWithFrame:frame collectionViewLayout:layout]) {
        [self setupViews];
    }
    return self;
}






-(void)setupViews
{
    self.backgroundColor = [UIColor grayColor];
    [self registerClass:[LLYImageBrowserViewCell class] forCellWithReuseIdentifier:LLYImageBrowserViewCellIdentifier];
    self.frame = CGRectMake(0, 0, K_ScreenW, K_ScreenH);
    self.pagingEnabled = YES;
    self.showsVerticalScrollIndicator = false;
    self.showsHorizontalScrollIndicator = false;
    self.delegate = self;
    self.dataSource = self;
    self.alwaysBounceVertical = NO;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    printf(__func__);
    
}

#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    if (_imageBrowsDelegate && [_imageBrowsDelegate respondsToSelector:@selector(didCliclDisMiss:)]) {
        [_imageBrowsDelegate didCliclDisMiss:self];
    }
}




#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (_imageBrowsDataSource && [_imageBrowsDataSource respondsToSelector:@selector(imageBrowserView:numberOfItenInSection:)]) {
        return [_imageBrowsDataSource imageBrowserView:self numberOfItenInSection:section];
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LLYImageBrowserViewCell *cell = (LLYImageBrowserViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:LLYImageBrowserViewCellIdentifier forIndexPath:indexPath];
    
 
    cell.scrollViewDidClick = ^{
        
        if (_imageBrowsDelegate && [_imageBrowsDelegate respondsToSelector:@selector(didCliclDisMiss:)]) {
            [_imageBrowsDelegate didCliclDisMiss:self];
        }
        
    };
    
    if (_imageBrowsDataSource && [_imageBrowsDataSource respondsToSelector:@selector(imageBrowserView:cellForItemAtIndexPath:)]) {
        cell.imageModel = [_imageBrowsDataSource imageBrowserView:self cellForItemAtIndexPath:indexPath];
        
    }else{
        cell.imageModel = nil;
    }
    return cell;
}


@end
