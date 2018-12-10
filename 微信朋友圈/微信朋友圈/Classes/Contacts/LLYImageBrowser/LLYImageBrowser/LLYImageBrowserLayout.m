//
//  LLYImageBrowserLayout.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowserLayout.h"

@implementation LLYImageBrowserLayout
-(instancetype)init
{
    if (self = [super init]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews
{
    self.itemSize = CGSizeMake(K_ScreenW, K_ScreenH);
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
