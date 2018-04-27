//
//  LLYImageBrowseCell.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/17.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowseCell.h"
@interface LLYImageBrowseCell()
//@property (nonatomic, strong) UIImageView *browseImage;
@end
@implementation LLYImageBrowseCell


-(instancetype)init
{
    if ([super init]) {
        [self setupView];
    }
    return [[NSBundle mainBundle]loadNibNamed:@"LLYImageBrowseCell" owner:self options:nil].lastObject;
}

-(void)setupView
{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(0, 0, 100, 100);
    [self.contentView addSubview:button];

}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.width = K_ScreenW;
    self.height = K_ScreenH;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissAction)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
    
    doubleTap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleTap];
    [tap requireGestureRecognizerToFail:doubleTap];
    
}
-(void)doubleTap
{
    NSLog(@"%s",__func__);
}
-(void)setIndex:(NSInteger)index
{
    _index = index;
//    self.pageViewController.numberOfPages =
//    self.pageViewController.currentPage = index;

}

-(void)disMissAction
{
//    [self removeFromSuperview];
    if (self.disMissView) {
        _disMissView();
    }
    
}

@end
