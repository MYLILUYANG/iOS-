//
//  LLYImageBrowser.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/6.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LLYImageBrowserDelegate<NSObject>
-(UIImage *)image;

@end


@interface LLYImageBrowser : UIView <UIScrollViewDelegate>



//@property (nonatomic, strong) NSArray<NSString *> *imagesArray;

/**
 图片总数
 */
@property (nonatomic, assign) NSInteger imageCount;
/**
 从第几张图片开始展示，默认第一张
 */
@property (nonatomic, assign) NSInteger currentImageIndex;

/**
 大图图片的数组
 */
@property (nonatomic, strong) NSArray<NSString *> *imagesArray;

-(void)show;

@property (nonatomic, copy) id<LLYImageBrowserDelegate> delegate;

@end
