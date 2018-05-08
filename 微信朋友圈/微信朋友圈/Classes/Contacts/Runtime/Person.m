//
//  Person.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/27.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
    free(ivars);
    return self;
}


-(void)eat:(NSString *)food
{
    NSLog(@"今天吃了%@",food);
}
@end
