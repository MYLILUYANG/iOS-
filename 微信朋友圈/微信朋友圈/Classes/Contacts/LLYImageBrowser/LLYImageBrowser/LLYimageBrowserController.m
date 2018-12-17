//
//  LLYimageBrowserController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYimageBrowserController.h"
#import "LLYImageBrowserView.h"
#import "LLYImageBrowserLayout.h"

@interface LLYimageBrowserController ()<LLYImageBrowserViewDelegate,LLYImageBrowserViewDataSource>
@property (nonatomic, strong) LLYImageBrowserView *browserView;
@end

@implementation LLYimageBrowserController

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.browserView layoutIfNeeded];
    
    [self.browserView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view addSubview:self.browserView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma -LLYImageBrowserViewDataSource

-(NSInteger)imageBrowserView:(LLYImageBrowserView *)imageBrowserView numberOfItenInSection:(NSInteger)section
{
    return self.imgModelArray.count;
}

-(LLYImageModel *)imageBrowserView:(LLYImageBrowserView *)imageBrowserView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return self.imgModelArray[indexPath.row];
}

#pragma -LLYImageBrowserViewDelegate

-(void)didCliclDisMiss:(LLYImageBrowserView *)view
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)show
{
    id controller = [[UIApplication sharedApplication] keyWindow].subviews[0].nextResponder;
    if ([controller isKindOfClass:[UIViewController class]]) {
        [controller presentViewController:self animated:YES completion:nil];
    }
}

-(LLYImageBrowserView *)browserView
{
    if (!_browserView) {
        _browserView = [[LLYImageBrowserView alloc] initWithFrame:CGRectZero collectionViewLayout:[LLYImageBrowserLayout new]];
        _browserView.imageBrowsDelegate = self;
        _browserView.imageBrowsDataSource = self;
        _browserView.currentIndex = 0;
    }
    return _browserView;
}
@end
