//
//  LLYImageBrowse.h
//  微信朋友圈
//
//  Created by liluyang on 2018/4/17.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLYImageBrowse : UIView

@property (nonatomic, copy) void(^imageBrowseViewDismiss)();
@property (nonatomic, assign) NSInteger tapIndex;

@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, copy) NSString *(^getImgUrl)(NSInteger index);

@end
