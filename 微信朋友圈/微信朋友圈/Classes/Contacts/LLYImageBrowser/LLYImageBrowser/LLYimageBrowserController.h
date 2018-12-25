//
//  LLYimageBrowserController.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLYImageModel.h"
#import "LLYImageBrwoserUtilies.h"
@interface LLYimageBrowserController : UIViewController

@property (nonatomic, strong) NSArray <LLYImageModel*> *imgModelArray;

@property (nonatomic, assign) NSInteger currentIndex;

-(void)show;

@property (nonatomic, assign) CGFloat animationDuration;

@property (nonatomic, assign) LLYImageBrowserViewAnimation inAnimation;

@end
