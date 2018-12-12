//
//  LLYImageBrowserViewCell.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowserViewCell.h"
#import "LLYImageModel.h"
#import <FLAnimatedImageView+WebCache.h>
@interface LLYImageBrowserViewCell()<UIScrollViewDelegate>

@property (nonatomic, strong) FLAnimatedImageView *animatedImageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *testImgView;
@property (nonatomic, strong) UILabel *label;
@end
@implementation LLYImageBrowserViewCell


-(void)setImageModel:(LLYImageModel *)imageModel{
    if (!imageModel) return;
    _imageModel = imageModel;
    
    [_animatedImageView sd_setImageWithURL:_imageModel.url placeholderImage:[UIImage imageNamed:@"qrcode_tabbar_icon_qrcode_highlighted"]];
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpViews];
    }
    return self;
}

-(void)setUpViews
{
    [self.contentView addSubview: self.scrollView];
    [self.scrollView addSubview:self.animatedImageView];
    
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, K_ScreenW, K_ScreenH)];
        _scrollView.delegate = self;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [_scrollView addGestureRecognizer:tap];
        
    }
    return _scrollView;
}

-(void)tapAction{
    
    self.scrollViewDidClick();
}

-(FLAnimatedImageView *)animatedImageView{
    if (!_animatedImageView) {
        _animatedImageView = [[FLAnimatedImageView alloc] init];
        _animatedImageView.frame = CGRectMake(0, 200, K_ScreenW, K_Width(300));
        _animatedImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _animatedImageView.userInteractionEnabled = YES;
    }
    return _animatedImageView;
}


@end
