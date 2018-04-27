//
//  LLYImgContainerView.h
//  微信朋友圈
//
//  Created by liluyang on 2018/4/3.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLYImgContainerView;

@protocol ImgContainerDelegate

//-(void)tapImageWithIndex:(NSInteger)index view:(LLYImgContainerView *)view;

@end

@interface LLYImgContainerView : UIView

-(id)initWithThumbnailImgsArray:(NSMutableArray *)thumbnailImgsArray;

@property (nonatomic, strong) NSMutableArray *thumbnailImgsArray;

@property (nonatomic, strong) NSArray *largeImgsArray;

@property (nonatomic, assign) CGFloat viewHeight;

//@property (nonatomic, copy) id<ImgContainerDelegate> delegate;

@end
