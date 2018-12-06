//
//  LayoutImagesView.h
//  微信朋友圈
//
//  Created by liluyang on 2018/9/12.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayoutImagesView : UIView

/**
 使用缩略图初始化

 @param thumbnailImgsArray 缩略图数组
 @return self view
 */
-(id)initWithThumbnailImgsArray:(NSMutableArray *)thumbnailImgsArray;

@property (nonatomic, strong) NSMutableArray *thumbnailImgsArray;

@property (nonatomic, strong) NSArray *largeImgsArray;

/**
 view 高度
 */
@property (nonatomic, assign) CGFloat viewHeight;
@end
