//
//  ImageBrowserCell.h
//  微信朋友圈
//
//  Created by liluyang on 2018/9/12.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageBrowserCell : UITableViewCell

-(void)initWithModelArray:(NSArray *)modelArray;

@property (nonatomic, strong) NSArray <NSString *> *modelArray;
//+(instancetype)loadViewNib;
@end
