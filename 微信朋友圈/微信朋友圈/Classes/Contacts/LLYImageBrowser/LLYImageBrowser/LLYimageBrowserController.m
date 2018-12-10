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

@interface LLYimageBrowserController ()<LLYImageBrowserViewDelegate>
@property (nonatomic, strong) LLYImageBrowserView *browserView;
@end

@implementation LLYimageBrowserController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view addSubview:self.browserView];
}

-(void)show
{
    id controller = [[UIApplication sharedApplication] keyWindow].subviews[0].nextResponder;
    
    NSLog(@"%@",controller);
    if ([controller isKindOfClass:[UIViewController class]]) {
        [controller presentViewController:self animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(LLYImageBrowserView *)browserView
{
    if (!_browserView) {
        _browserView = [[LLYImageBrowserView alloc] initWithFrame:CGRectZero collectionViewLayout:[LLYImageBrowserLayout new]];
        _browserView.imageBrowsDelegate = self;
        
    }
    return _browserView;
}


- (void)didCliclDisMiss:(LLYImageBrowserView *)view
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
