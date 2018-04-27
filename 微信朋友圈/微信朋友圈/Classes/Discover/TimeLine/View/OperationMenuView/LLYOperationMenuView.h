//
//  LLYOperationMenuView.h
//  微信朋友圈
//
//  Created by liluyang on 2018/4/9.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLYOperationMenuView : UIView

@property (nonatomic, assign, getter=isShowing) BOOL show;



@property (nonatomic, copy) void (^likeBtnClicked)();

@property (nonatomic, copy) void (^commentBtnClicked)();

@end
