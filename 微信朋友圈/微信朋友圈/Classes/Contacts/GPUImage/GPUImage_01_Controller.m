//
//  GPUImage_01_Controller.m
//  微信朋友圈
//
//  Created by liluyang on 2018/5/4.
//  Copyright © 2018年 liluyang. All rights reserved.
//   根据 落影loyinglin 大神简书文档 学习

#import "GPUImage_01_Controller.h"
#import <GPUImage.h>
@interface GPUImage_01_Controller ()
@property (nonatomic, strong) UIImageView *mImageView;
@end

@implementation GPUImage_01_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.mImageView];
    [self onCustom];
    
}

-(void)onCustom
{
    GPUImageFilter *filter = [[GPUImageSepiaFilter alloc] init];
    UIImage *image = [UIImage imageNamed:@"sky"];
    if (image) {
        self.mImageView.image = [filter imageByFilteringImage:image];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
