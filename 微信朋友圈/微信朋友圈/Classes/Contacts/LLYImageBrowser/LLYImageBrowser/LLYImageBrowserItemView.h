//
//  LLYImageBrowserItemView.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/7.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FLAnimatedImageView+WebCache.h>
@interface LLYImageBrowserItemView : UIView
@property (nonatomic, strong) FLAnimatedImageView *imageView;

-(void)setImageWithURL:(NSURL *)url placeholcerImg:(UIImage *)img;

@end
