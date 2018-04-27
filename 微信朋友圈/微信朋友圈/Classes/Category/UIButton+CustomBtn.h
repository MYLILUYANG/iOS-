//
//  UIButton+CustomBtn.h
//  微信朋友圈
//
//  Created by liluyang on 2018/4/9.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CustomBtn)
+(UIButton *)lly_creatButtonTitle:(NSString *)title normalImg:(NSString *)normalImg selImg:(NSString *)selImg target:(id)target selector:(SEL)sel;
@end
