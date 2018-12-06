//
//  LayoutImagesView.m
//  微信朋友圈
//
//  Created by liluyang on 2018/9/12.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LayoutImagesView.h"
@interface LayoutImagesView()
{
    NSMutableArray *_thumbViewsArray;
}
@end
@implementation LayoutImagesView


-(id)initWithThumbnailImgsArray:(NSMutableArray *)thumbnailImgsArray
{
    if (self = [super init]) {
        
        [self setUpView:thumbnailImgsArray];
    }
    return self;
}
-(void)setUpView:(NSMutableArray*)thumbnailImgsArray
{
    _thumbViewsArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < thumbnailImgsArray.count; i++) {
        
        UIImageView *itemView = [[UIImageView alloc] init];
        itemView.userInteractionEnabled = YES;
        itemView.backgroundColor = K_RandColor;
        itemView.layer.cornerRadius = 3;
        itemView.layer.masksToBounds = YES;
        itemView.hidden = YES;
        itemView.tag = i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [itemView addGestureRecognizer:tap];
        
        [self addSubview:itemView];
        [_thumbViewsArray addObject:itemView];
    }
}

-(void)setThumbnailImgsArray:(NSMutableArray *)thumbnailImgsArray
{
    _thumbnailImgsArray = _thumbnailImgsArray;
    [self setUpView:thumbnailImgsArray];
    
//    for (long i = _thumbnailImgsArray.count; i < _thumbViewsArray.count; i++) {
//        UIImageView *imageView = [_thumbViewsArray objectAtIndex:i];
//        
//    }
    
    
    
}



-(void)tapAction:(UITapGestureRecognizer *)tap{
    NSLog(@"123");
}

@end
