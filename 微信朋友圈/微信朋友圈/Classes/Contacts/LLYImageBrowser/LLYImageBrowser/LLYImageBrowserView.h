//
//  LLYImageBrowserView.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LLYImageBrowserView;
@class LLYImageModel;
@protocol LLYImageBrowserViewDelegate<NSObject>

-(void)didCliclDisMiss:(LLYImageBrowserView *)view;

@end

@protocol LLYImageBrowserViewDataSource <NSObject>

-(NSInteger)imageBrowserView:(LLYImageBrowserView *)imageBrowserView numberOfItenInSection:(NSInteger)section;

-(LLYImageModel *)imageBrowserView:(LLYImageBrowserView *)imageBrowserView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LLYImageBrowserView : UICollectionView<LLYImageBrowserViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak)  id<LLYImageBrowserViewDelegate>imageBrowsDelegate;
@property (nonatomic, weak)  id<LLYImageBrowserViewDataSource>imageBrowsDataSource;
@property (nonatomic, assign) NSInteger currentIndex;
@end
