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
#import "LLYImageBrowserTranslationAnimate.h"
#import "LLYImageBrwoserUtilies.h"
@interface LLYimageBrowserController ()<LLYImageBrowserViewDelegate,LLYImageBrowserViewDataSource, UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) LLYImageBrowserView *browserView;
@property (nonatomic, strong) LLYImageBrowserTranslationAnimate *translationAnimate;
@end

@implementation LLYimageBrowserController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.modalPresentationStyle = UIModalPresentationCustom;
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

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

-(void)initData
{
    _animationDuration = 0.3;
    _translationAnimate = [LLYImageBrowserTranslationAnimate new];
    self.transitioningDelegate = self;
    _inAnimation = LLYImageBrowserViewAnimationMove;
}


#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [self.translationAnimate setInfoWithBrowserView:self];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [self.translationAnimate setInfoWithBrowserView:self];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark- LLYImageBrowserViewDataSource

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

#pragma mark - lazyLoad

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
