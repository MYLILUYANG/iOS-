//
//  LLYImageBrowserView.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LLYImageBrowserView;

@protocol LLYImageBrowserViewDelegate<NSObject>

-(void)didCliclDisMiss:(LLYImageBrowserView *)view;

@end

@interface LLYImageBrowserView : UICollectionView<LLYImageBrowserViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak)  id<LLYImageBrowserViewDelegate>imageBrowsDelegate;

@end
