//
//  LLYOperationMenuView.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/9.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYOperationMenuView.h"
#import "UIButton+CustomBtn.h"
@implementation LLYOperationMenuView
{
    UIButton *_likeBtn;
    
    UIButton *_commentBtn;
    
    UIView *_verticalLine;
}

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    NSLog(@"__func__ = %s",__func__);
//    if (self = [super initWithFrame:frame]) {
//        
//        [self setupView];
//    }
//    return self;
//}

-(instancetype)init
{
    NSLog(@"__func__ = %s",__func__);
    if ( self = [super init]) {

        [self setupView];
    };
    
    return self;
}



-(void)setupView
{

    self.clipsToBounds = YES;
    self.layer.cornerRadius = 5;
    self.backgroundColor = K_RGB(69, 74, 76) ;
    _likeBtn = [UIButton lly_creatButtonTitle:@"赞" normalImg:@"AlbumLike" selImg:@"" target:self selector:@selector(likeBtn:)];
    _commentBtn = [UIButton lly_creatButtonTitle:@"评价" normalImg:@"AlbumComment" selImg:@"" target:self selector:@selector(commenBtn:)];
    
    _verticalLine = [UIView new];
    _verticalLine.backgroundColor = [UIColor lightGrayColor];
    
    NSArray *viewArray = @[_likeBtn, _commentBtn, _verticalLine];
    
    [viewArray enumerateObjectsUsingBlock:^(UIView * view, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([view isKindOfClass:[UIView class]]) {
//            NSLog(@"viewviewviewviewview = %@",view);
            [self addSubview:view];
        }
    }];
    float margin = K_Height(5);
    
    _likeBtn.sd_layout
    .leftSpaceToView(self, margin)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(K_Width(80));

    _verticalLine.sd_layout
    .leftSpaceToView(_likeBtn, margin)
    .topSpaceToView(self, margin)
    .bottomSpaceToView(self, margin)
    .widthIs(1);
    
    
    _commentBtn.sd_layout
    .leftSpaceToView(_verticalLine, margin)
    .topEqualToView(_likeBtn)
    .bottomEqualToView(_likeBtn)
    .widthRatioToView(_likeBtn, 1);
    
    
    
}

-(void)commenBtn:(UIButton *)button
{
    if (self.commentBtnClicked) {
        self.commentBtnClicked();
    }
    self.show = NO;
}

-(void)likeBtn:(UIButton *)button
{
    if (self.likeBtnClicked) {
        self.likeBtnClicked();
    }
    self.show = NO;
}

-(void)setShow:(BOOL)show
{
    _show = show;
    
    [UIView animateWithDuration:0.2 animations:^{
        if (!show) {
            [self clearAutoWidthSettings];
            self.sd_layout
            .widthIs(0);
//            _commentBtn.sd_layout.widthIs(K_Width(0));
//            _likeBtn.sd_layout.widthIs(K_Width(0));
        } else {
            self.fixedWidth = nil;
            self.sd_layout
            .widthIs(K_Width(100));
//            _commentBtn.sd_layout.widthIs(K_Width(30));
//            _likeBtn.sd_layout.widthIs(K_Width(30));
            [self setupAutoWidthWithRightView:_commentBtn rightMargin:K_Width(5)];
        }
        [self updateLayoutWithCellContentView:self.superview];
    }];
        
   
}

@end
