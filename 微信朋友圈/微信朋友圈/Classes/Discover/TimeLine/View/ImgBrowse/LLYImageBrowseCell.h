//
//  LLYImageBrowseCell.h
//  微信朋友圈
//
//  Created by liluyang on 2018/4/17.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LLYImageBrowseCellDelegate <NSObject>



@end

@interface LLYImageBrowseCell : UICollectionViewCell

@property (nonatomic, copy) void(^disMissView)();
@property (nonatomic, strong) UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *browseImage;

@property (nonatomic, assign) NSInteger index;


@end
