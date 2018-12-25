//
//  LLYimgProtocolTranslationAnimate.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/20.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYimgProtocolTranslationAnimate.h"

@implementation LLYimgProtocolTranslationAnimate

-(instancetype)init
{
    if (self = [super init]) {
        self.duration = 0.3;
        self.originalFrame = CGRectZero;
        self.presenting = YES;
    }
    return self;
}



- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC =  [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    
    UIView *showView = self.presenting ? toView : fromView;
    
    CGFloat scrolX = CGRectGetWidth(showView.frame) ? CGRectGetWidth(self.originalFrame) / CGRectGetWidth(showView.frame) : 0;
    CGFloat scrolY = CGRectGetHeight(showView.frame) ? CGRectGetHeight(self.originalFrame) / CGRectGetHeight(showView.frame) : 0;
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scrolX, scrolY);
    
    CGPoint orginCenter = CGPointMake(CGRectGetMidX(self.originalFrame), CGRectGetMidY(self.originalFrame));
    
    CGPoint showViewCenter = CGPointMake(CGRectGetMidX(showView.frame), CGRectGetMidY(showView.frame));
    
    CGAffineTransform startTransform, endTransform;
    
    CGPoint startCenter, endCenter;
    
    if (self.presenting) {
        startTransform = transform;
        startCenter = orginCenter;
        endTransform = CGAffineTransformIdentity;
        endCenter = showViewCenter;
    }
    else {
        startTransform = CGAffineTransformIdentity;
        startCenter = showViewCenter;
        endTransform = transform;
        endCenter = orginCenter;
    }
    
    
    UIView *container = [transitionContext containerView];
    [container addSubview:toView];
    [container bringSubviewToFront:showView];
    
    showView.transform = startTransform;
    showView.center = startCenter;
    [UIView animateWithDuration:self.duration animations:^{
        showView.transform = endTransform;
        showView.center = endCenter;
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
    
//    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//
//    if ([transitionContext transitionWasCancelled]) {
//        //        取消转场
//    }else{
//        //        完成转场
//
//    }
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    
    return self.duration;
}

@end
