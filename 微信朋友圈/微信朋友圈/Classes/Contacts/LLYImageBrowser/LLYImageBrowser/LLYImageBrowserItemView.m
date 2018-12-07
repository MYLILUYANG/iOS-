//
//  LLYImageBrowserItemView.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/7.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowserItemView.h"

@implementation LLYImageBrowserItemView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
        printf("123123");
    }
    return self;
}

-(void)setupView{

    [self addSubview:self.imageView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}
-(void)setImageWithURL:(NSURL *)url placeholcerImg:(UIImage *)img
{
    NSLog(@"url = %@",url);
//    [self.imageView sd_setImageWithURL:url placeholderImage:img];
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    
}
-(FLAnimatedImageView *)imageView{
    
    if (!_imageView) {
        
        _imageView = [[FLAnimatedImageView alloc] init];
        _imageView.backgroundColor = K_RandColor;
        _imageView.userInteractionEnabled = YES;
        _imageView.frame = CGRectMake(0, 0, 100, 100);
        _imageView.userInteractionEnabled = true;
    }
    
    return _imageView;
    
}

@end
