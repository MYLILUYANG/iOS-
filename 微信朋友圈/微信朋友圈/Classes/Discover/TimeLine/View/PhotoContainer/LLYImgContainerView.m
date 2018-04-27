//
//  LLYImgContainerView.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/3.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImgContainerView.h"
#import "LLYImageBrowse.h"
//#defend itemSizeWH K_Width(100)
#define K_ItemWH K_Width(50)
@interface LLYImgContainerView()

@property (nonatomic, strong) NSMutableArray *thumbViewsArray;

@end
@implementation LLYImgContainerView

-(id)initWithThumbnailImgsArray:(NSArray *)thumbnailImgsArray
{
    if (self = [super init]) {
//        self.thumbnailImgsArray = thumbnailImgsArray;
        [self setUpView];
    }
    
    return self;
}

-(instancetype)init
{
    if (self = [super init]) {
        
        [self setUpView];
    }
    
    return self;
}

-(void)setUpView
{
//    self.backgroundColor = [UIColor lightGrayColor];
    _thumbViewsArray = [[NSMutableArray alloc] init];
//    NSInteger count = _thumbnailImgsArray.count;
    for (int i = 0; i < 9; i++) {
        
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

-(void)tapAction:(UITapGestureRecognizer *)tap
{
    LLYImageBrowse * imageBrowse = [[LLYImageBrowse alloc] initWithFrame:CGRectMake(0, 0, K_ScreenW, K_ScreenH)];
    imageBrowse.maxCount = self.thumbnailImgsArray.count;
    imageBrowse.tapIndex = tap.view.tag;
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    [window addSubview:imageBrowse];

    __weak typeof(imageBrowse) wkImageBrowse = imageBrowse;
    [imageBrowse setImageBrowseViewDismiss:^{
        [wkImageBrowse removeFromSuperview];
    }];
    [imageBrowse setGetImgUrl:^NSString *(NSInteger index) {
       
       return self.thumbnailImgsArray[index];

        
    }];
    
}




-(void)setThumbnailImgsArray:(NSMutableArray *)thumbnailImgsArray
{
    _thumbnailImgsArray = thumbnailImgsArray;

//    设置frame
  
    CGFloat margin = K_Width(5);
    CGRect itemFram;
    UIImageView *itemView;
    itemView.backgroundColor = K_RandColor;
    for (int i = 0; i < _thumbnailImgsArray.count; i++) {
    itemView  = self.thumbViewsArray[i];
    switch (_thumbnailImgsArray.count) {
        case 1:
            //            需要根据图片实际大小比例来构图
            itemFram = CGRectMake(margin, margin, K_ItemWH * 2, K_ItemWH *2);
            break;
        case 2:
            itemFram = CGRectMake(margin * i + K_ItemWH * 1.5 * i, margin, K_ItemWH * 1.5 , K_ItemWH * 1.5 );
            break;
        case 3:
            itemFram = CGRectMake(margin * i + K_ItemWH * i, margin, K_ItemWH , K_ItemWH );
            break;
        case 4:

            itemFram = CGRectMake((margin + (margin + K_ItemWH * 1.5) * (i % 2))  , (margin + (margin + K_ItemWH * 1.5) * (i / 2)) , K_ItemWH * 1.5 , K_ItemWH * 1.5 );

            break;
        case 5:
        case 6:

            itemFram = CGRectMake((margin + (margin + K_ItemWH) * (i % 3))  , (margin + (margin + K_ItemWH) * (i / 3)) , K_ItemWH , K_ItemWH );
            break;
        case 7:
        case 8:
        case 9:
            itemFram = CGRectMake((margin + (margin + K_ItemWH) * (i % 3))  , (margin + (margin + K_ItemWH) * (i / 3)) , K_ItemWH, K_ItemWH);
            break;
        default:
            break;
        }
        itemView.frame = CGRectMake(itemFram.origin.x, itemFram.origin.y, itemFram.size.width, itemFram.size.height);
        
        itemView.hidden = NO;

        [itemView sd_setImageWithURL:[NSURL URLWithString:_thumbnailImgsArray[i]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        }];
    }
}



@end
