//
//  LayoutImagesView.m
//  微信朋友圈
//
//  Created by liluyang on 2018/9/12.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LayoutImagesView.h"
#import <FLAnimatedImage.h>
#import "LLYimageBrowserController.h"

#import "LLYImageBrowser/LLYImageModel.h"
@interface LayoutImagesView()
{
    NSMutableArray *_thumbViewsArray;
}
@end
@implementation LayoutImagesView

-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.backgroundColor = K_RandColor;
    self.userInteractionEnabled = true;
    __block CGFloat viewHeight;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat item_W, item_H;
        CGFloat item_Margin = 5;
        NSInteger item_col;

//        一张图片的情况
        if (self.subviews.count == 1) {
            item_col = 1;
            item_H = K_Height(100);
            item_W = K_Width(190);
            viewHeight = K_Height(105);
        }else if(self.subviews.count == 2){
//            两张图片的情况
            item_col = 2;
            item_H = K_Height(95);
            item_W = K_Width(95);
            viewHeight = K_Height(100);
        }else{
//            三张及以上图片
            item_col = 3;
            item_H = K_Height(60);
            item_W = K_Width(60);
            viewHeight = K_Height(65) * ( idx / item_col) + K_Height(65);
//            NSLog(@"( idx / item_col) = %lu",idx / item_col);
        }
        
        NSInteger row = idx % item_col;
        NSInteger col = idx / item_col;
       
        CGPoint point = CGPointMake(item_Margin + (item_W + item_Margin) * row, item_Margin + (item_H + item_Margin) * col);
        
        imageView.frame = CGRectMake(point.x, point.y, item_W, item_H);
        

    }];
  
//    NSLog(@"viewHeight = %.2f",viewHeight);
    
    self.frame = CGRectMake(K_Width(50), 0, K_ScreenW - K_Width(100), viewHeight);
    self.viewHeight(viewHeight);
}

-(id)initWithThumbnailImgsArray:(NSMutableArray *)thumbnailImgsArray
{
    if (self = [super init]) {
        [self setUpView:thumbnailImgsArray];
    }
    return self;
}
-(void)setUpView:(NSMutableArray*)thumbnailImgsArray
{
    [self setupThumbViewWithArray:thumbnailImgsArray];
}

-(void)setupThumbViewWithArray:(NSArray*)array{
    
    [array enumerateObjectsUsingBlock:^(LLYImageModel  * _Nonnull  obj, NSUInteger idx, BOOL * _Nonnull stop) {
        FLAnimatedImageView *view = [[FLAnimatedImageView alloc] init];
#warning 加载图片可以参考sd 模型的。
        
        [view sd_setImageWithURL:obj.url placeholderImage:[self createImageWithColor:K_RandColor]];
        view.tag = idx;
        view.userInteractionEnabled = YES;
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
        view.layer.cornerRadius = 3;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [view addGestureRecognizer:tap];
        [self addSubview:view];
    }];
}
// 颜色转图片
-(UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

-(void)setLargeImgsArray:(NSArray *)largeImgsArray{
    _largeImgsArray = largeImgsArray;
    [self setupThumbViewWithArray:largeImgsArray];
}

-(void)setThumbnailImgsArray:(NSMutableArray *)thumbnailImgsArray
{
    _largeImgsArray = thumbnailImgsArray;
    [self setupThumbViewWithArray:thumbnailImgsArray];
}

-(void)tapAction:(UITapGestureRecognizer *)tap{
    FLAnimatedImageView *showImageView = (FLAnimatedImageView *)tap.view;
 
    
    LLYimageBrowserController * controller = [[LLYimageBrowserController alloc] init];
    controller.imgModelArray = self.largeImgsArray;
    controller.currentIndex = showImageView.tag;
    [controller show];
}

@end
