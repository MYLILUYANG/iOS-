//
//  LLYImageBrowserTranslationAnimate.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/20.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LLYimageBrowserController;
@interface LLYImageBrowserTranslationAnimate : NSObject<UIViewControllerAnimatedTransitioning>

-(LLYImageBrowserTranslationAnimate *)setInfoWithBrowserView:(LLYimageBrowserController *)browserView;

@end
