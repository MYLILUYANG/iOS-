//
//  LLYImageBrowser.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/6.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowser.h"
#import "LLYImageBrowserItemView.h"
@implementation LLYImageBrowser
{
    UIScrollView *_scrollView;
    UIView *_contentView;
    UILabel *_indexLabel;
    UIButton *_saveBtn;
}
-(void)layoutSubviews{
    [super layoutSubviews];
}
//视图移动完成
-(void)didMoveToSuperview{
    [super didMoveToSuperview];
    [self setupScrollView];
    [self setupFooterTools];
}

-(void)setupScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, K_ScreenW, K_ScreenH)];
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = false;
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.pagingEnabled = true;
    [self addSubview:_scrollView];
    
    for (int i = 0; i < self.imageCount; i++) {
        LLYImageBrowserItemView *itemView = [[LLYImageBrowserItemView alloc] initWithFrame:CGRectMake(0, 0, K_ScreenW, K_ScreenW)];
        itemView.tag = i;
        [_scrollView addSubview:itemView];
    }
    [self setUpImageOfImageViewIndex:self.currentImageIndex];
}

/**
 加载图片

 @param index 当前图片下标
 */
-(void)setUpImageOfImageViewIndex:(NSInteger)index
{
    LLYImageBrowserItemView *itemView = _scrollView.subviews[index];
    [itemView setImageWithURL:[self getHighQUalityImageURL:self.currentImageIndex] placeholcerImg:[UIImage imageNamed:@"test"]];
}
-(NSURL *)getHighQUalityImageURL:(NSInteger)index
{
    return [NSURL URLWithString:self.imagesArray[index]];
}
/**
 设置页码和保存按钮
 */
-(void)setupFooterTools
{
    UILabel *indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, K_ScreenH - K_Height(50), K_ScreenW, K_Height(50))];
    
    indexLabel.text = @"label";
    indexLabel.textColor = [UIColor whiteColor];
    indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel = indexLabel;
    [self addSubview:indexLabel];
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(K_Width(20), K_ScreenH - K_Height(50), K_Width(100), K_Height(50));
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _saveBtn = saveBtn;
    [self addSubview:saveBtn];
    
    
}

-(void)saveBtnClick
{
    printf(__func__);
}

-(instancetype)init
{
    if (self = [super init]) {
        [self setupView];
    }
    return  self;
}

-(void)setupView
{
    NSLog(@"设置view");
    self.backgroundColor = K_RandColor;
    self.frame = CGRectMake(0, 0, 200, 200);
    self.userInteractionEnabled = YES;
//    NSLog(@"%@",NSStringFromCGRect(self.frame));
}

-(void)show{
    _contentView = [[UIView alloc] init];
//    _contentView.backgroundColor = K_RandColor;
    
    UIWindow *window = [UIApplication  sharedApplication].keyWindow;
    _contentView.bounds = window.bounds;
    _contentView.center = window.center;
    [_contentView addSubview:self];
    
    [window addSubview:_contentView];
    
//    [self performSelector:@selector(<#selector#>) withObject:self afterDelay:0.3];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"shanchu");
    
    [_contentView removeFromSuperview];
}

@end
