//
//  NSString+attribute.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/27.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "NSString+attribute.h"
#import <objc/runtime.h>
const char *name = "name";
@implementation NSString (attribute)

-(void)setHaha:(NSString *)haha
{
    objc_setAssociatedObject(self, name, haha, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSString *)haha{
    return objc_getAssociatedObject(self, name);
}
@end
