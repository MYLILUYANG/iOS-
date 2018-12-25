//
//  LLYImageBrowserTranslationAnimate.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/20.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowserTranslationAnimate.h"
#import "LLYimageBrowserController.h"
#import "LLYImageModel.h"
@interface LLYImageBrowserTranslationAnimate()
{
    //   __weak LLYimageBrowserController *_browserView;
    
}

@property (nonatomic, weak) LLYimageBrowserController *browserView;
@end
@implementation LLYImageBrowserTranslationAnimate

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return _browserView.animationDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    if (toVC.beingPresented) {
        [containerView addSubview:toView];
        switch (self.browserView.inAnimation) {
            case LLYImageBrowserViewAnimationFade:
//                NSLog(@"LLYImageBrowserViewAnimationFade");
//                [self outAnimate_moveWithContext:transitionContext containerView:containerView fromView:fromView];
                break;
            case LLYImageBrowserViewAnimationMove:
//                NSLog(@"LLYImageBrowserViewAnimationMove");
                [self outAnimate_moveWithContext:transitionContext containerView:containerView fromView:fromView];
                break;
            default:
                NSLog(@"没有动画");
                break;
        }
    }
}

-(void)outAnimate_moveWithContext:(id <UIViewControllerContextTransitioning>)context containerView:(UIView*)containerView fromView:(UIView *)fromView
{
    CGRect fromFrame;
    UIImage *image;
    
//    NSLog(@"11111");
    
    NSArray *modelArray = self.browserView.imgModelArray;
    NSInteger index = self.browserView.currentIndex;

    LLYImageModel *currentModel = modelArray[index];
    
    
    
    
    NSLog(@"%@",self.browserView);
    
    
    [UIView animateWithDuration:self.browserView.animationDuration animations:^{
        
    }completion:^(BOOL finished) {
        
    }];

}

-(LLYImageBrowserTranslationAnimate *)setInfoWithBrowserView:(LLYimageBrowserController *)browserView
{
    if (!browserView) return nil;
    NSLog(@"%ld",(long)browserView.inAnimation);
    _browserView = browserView;
    return self;
}
@end
