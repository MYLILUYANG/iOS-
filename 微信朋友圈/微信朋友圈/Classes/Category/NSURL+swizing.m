//
//  NSURL+swizing.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/27.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "NSURL+swizing.h"
#import <objc/runtime.h>
@implementation NSURL (swizing)


+ (void)load
{
//    在文件加载的时候替换两个方法
    
    Method method1 = class_getClassMethod([self class], @selector(LLY_URLWithString:));
    Method method2 = class_getClassMethod([NSURL class], @selector(URLWithString:));
    
    method_exchangeImplementations(method1, method2);
    
}

+(NSURL*)LLY_URLWithString:(NSString *)URLString
{
    URLString = [URLString stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (URLString == nil) {
        NSLog(@"您的url为空");
    }
    return [NSURL LLY_URLWithString:URLString];
    
}
@end
