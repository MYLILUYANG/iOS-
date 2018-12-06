//
//  LLYImageBrowser.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/6.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLYImageBrowser : UIView

@property (nonatomic, strong) NSArray<NSString *> *imagesArray;

-(void)show;

@end
