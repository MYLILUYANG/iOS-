//
//  LLYImageBrowserView.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowserView.h"

#import "LLYImageBrowserViewCell.h"

@interface LLYImageBrowserView()

@end
@implementation LLYImageBrowserView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    if (self =  [super initWithFrame:frame collectionViewLayout:layout]) {
        [self setupViews];
    }
    return self;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    printf(__func__);
    if (_imageBrowsDelegate && [_imageBrowsDelegate respondsToSelector:@selector(didCliclDisMiss:)]) {
        
        [_imageBrowsDelegate didCliclDisMiss:self];
    }
}

-(void)setupViews
{
    self.backgroundColor = [UIColor grayColor];
    
    [self registerClass:[LLYImageBrowserViewCell class] forCellWithReuseIdentifier:@"itemId"];
    self.frame = CGRectMake(0, 0, K_ScreenW, K_ScreenH);
    self.pagingEnabled = YES;
    self.showsVerticalScrollIndicator = false;
    self.showsHorizontalScrollIndicator = false;
    self.delegate = self;
    self.dataSource = self;
    self.alwaysBounceVertical = NO;
}

-(NSInteger)numberOfSections
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLYImageBrowserViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemId" forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    label.text = @"lllllaaaaaabbbbeeeeelll";
    label.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview: label];
    
    //    cell.backgroundColor = [UIColor redColor];
    
    return cell;
    
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}



@end
