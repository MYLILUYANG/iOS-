//
//  LLYImageBrowserViewCell.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LLYImageModel;
@class LLYImageBrowserViewCell;

//void (^scrollViewDidClick) (LLYImageBrowserViewCell *);

@interface LLYImageBrowserViewCell : UICollectionViewCell

@property (nonatomic, strong) LLYImageModel *imageModel;

@property (nonatomic, strong) void (^signalTapAction)(void);


/**
 计算图片缩放比例代码

 @param containerSize 容器size
 @param image 要缩放的图片
 @param completd 完成回调
 */
+(void)countWithContainerSize:(CGSize)containerSize image:(id)image completd:(void(^)(CGRect _imageFrame, CGSize _contentSize ,CGFloat _minimumZoolScale, CGFloat _maximunZoolScale))completd;

@end
