//
//  UIButton+CustomBtn.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/9.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "UIButton+CustomBtn.h"

@implementation UIButton (CustomBtn)
+(UIButton *)lly_creatButtonTitle:(NSString *)title normalImg:(NSString *)normalImg selImg:(NSString *)selImg target:(id)target selector:(SEL)sel
{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:K_Width(12)];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    return button;
 
}
@end
