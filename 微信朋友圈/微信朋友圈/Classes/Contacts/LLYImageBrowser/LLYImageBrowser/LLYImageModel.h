//
//  LLYImageModel.h
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LLYImageModel;

typedef void (^LLYImageBrowserDownloadProgressBlock) (LLYImageModel *backModel, NSInteger receiveSize, NSInteger expectedSize, NSURL * _Nullable targetURL);

typedef void (^LLYImageBrowserDownloadSuccessBlock)( LLYImageModel *backModel, UIImage * _Nullable image, NSData * _Nullable data, BOOL finished);

typedef void (^LLYImageBrowserDownLoadFailedBlock)( LLYImageModel *backModel, NSError *error, BOOL finished);


@interface LLYImageModel : NSObject

/**
 网络图片URL
 */
@property (nonatomic, strong) NSURL *url;

-(void)setURLWithDownloadAdvance:(NSURL *)url;

@end
