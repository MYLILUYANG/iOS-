//
//  LLYImageModel.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageModel.h"

@implementation LLYImageModel
{
    __weak id downloadToken;
    SDWebImageDownloader *downLoader;
}
-(void)setURLWithDownloadAdvance:(NSURL *)url
{
    _url = url;
    
//    [self downloadImagProgress:nil success:nil faile:nil];
}

-(void)setUrl:(NSURL *)url
{
    _url = url;
}

-(void)dealloc{
    
    if (downloadToken) [downLoader cancel:downloadToken];
}

-(void)downloadImagProgress:(LLYImageBrowserDownloadProgressBlock)progress success:(LLYImageBrowserDownloadSuccessBlock) success faile:(LLYImageBrowserDownLoadFailedBlock)faile{
    
    LLYImageModel *imgModel = self;
    
    downloadToken = [downLoader downloadImageWithURL:imgModel.url options:SDWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        if (progress) progress(self, receivedSize,  expectedSize,  targetURL);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        if (error) {
            if (error) faile(self,error,finished);
            return ;
        }
        if (success) success(self,image, data, finished);
    }];
}

@end
