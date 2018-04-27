//
//  LLYTimeLineCell.h
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLYTimeLineModel.h"
//@class LLYTimeLineCell;
#import "LLYTimeLineFrameModel.h"
@protocol LLYTimeLineCellDelegate <NSObject>



@end

@interface LLYTimeLineCell : UITableViewCell

+(id)initCellWithTableView:(UITableView*)tableView identifier:(NSString *)identifier;

-(void)setModel:(LLYTimeLineFrameModel*)model;

@property (nonatomic, weak) id<LLYTimeLineCellDelegate> delegate;

@property (nonatomic, assign) CGFloat cellHeight;
//操作哪个cell  从控制器传过来
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) void (^moreTextBtnClicked) (NSIndexPath *indexPath);



@end
