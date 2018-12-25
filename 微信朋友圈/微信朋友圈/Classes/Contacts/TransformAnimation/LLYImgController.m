//
//  LLYImgController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/20.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImgController.h"
#import "LLYImg2ViewController.h"
#import "LLYimgProtocolTranslationAnimate.h"
@interface LLYImgController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIView *baseView;
@end

@implementation LLYImgController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    view.backgroundColor = K_RandColor;
    view.userInteractionEnabled = YES;
    [self.view addSubview:view];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [view addGestureRecognizer:tap];
    _baseView = view;
}

-(void)tapAction:(UITapGestureRecognizer *)tap
{
    printf(__func__);
    LLYImg2ViewController *controller= [[LLYImg2ViewController alloc] init];
    
    controller.transitioningDelegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    NSLog(@"弹出");
    return [self generateAnimatorWithPresenting:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    NSLog(@"取消");
    return [self generateAnimatorWithPresenting:NO];
}

-(LLYimgProtocolTranslationAnimate *)generateAnimatorWithPresenting:(BOOL)presting
{
    LLYimgProtocolTranslationAnimate *animate = [[LLYimgProtocolTranslationAnimate alloc] init];
//    _baseView
    animate.presenting = presting;
    animate.originalFrame = [self.baseView.superview convertRect:self.baseView.frame toView:nil];
    return animate;
}

//
//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
//{
//
//}
//
//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
//{
//
//}

//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0)
//{
//    
//}

@end
