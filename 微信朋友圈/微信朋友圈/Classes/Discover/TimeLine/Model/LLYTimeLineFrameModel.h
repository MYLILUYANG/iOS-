//
//  LLYTimeLineFrameModel.h
//  微信朋友圈
//
//  Created by liluyang on 2018/4/8.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLYTimeLineModel.h"
@interface LLYTimeLineFrameModel : NSObject

@property (nonatomic, strong) LLYTimeLineModel *timeLineModel;

@property (nonatomic, assign) CGFloat imgBrowseH;

@property (nonatomic, assign) CGFloat cellHeight;

@end
