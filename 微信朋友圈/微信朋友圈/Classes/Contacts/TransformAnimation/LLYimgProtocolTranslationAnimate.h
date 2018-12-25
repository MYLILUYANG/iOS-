//
//  LLYimgProtocolTranslationAnimate.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/20.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLYimgProtocolTranslationAnimate : NSObject<UIViewControllerAnimatedTransitioning>
//动画时长
@property (nonatomic, assign) CGFloat duration;
//图片原位置
@property (nonatomic, assign) CGRect originalFrame;
//展示或消失
@property (nonatomic, assign) BOOL presenting;

@end
