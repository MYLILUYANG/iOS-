//
//  PresentDismissController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/17.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "PresentDismissController.h"

@interface PresentDismissController ()

@end

@implementation PresentDismissController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
//所有的过度动画都需要在这里完成
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC =  [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    
    if ([transitionContext transitionWasCancelled]) {
        //        取消转场
    }else{
        //        完成转场
        
    }
}

@end
