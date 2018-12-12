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

@property (nonatomic, strong) void (^scrollViewDidClick)(void);

@end
