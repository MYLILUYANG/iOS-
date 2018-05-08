//
//  NSObject+Category.m
//  微信朋友圈
//
//  Created by liluyang on 2018/5/8.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>
@implementation NSObject (Category)
+(instancetype)modelWithDict:(NSDictionary *)dict
{

    id objc = [self new];
    for (NSString *property in [self propertyList]) {
        if (dict[property]) {
            [objc setValue:dict[property] forKey:property];
        }
    }
    return objc;
}


+(NSArray *)propertyList
{
    unsigned int count = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < count; i++) {
        
        NSString *string = [NSString stringWithUTF8String:property_getName(propertyList[i])];
        
        [arr addObject:string];

    }
    free(propertyList);
    return [arr copy];
}

+(NSArray *)modelsWithArray:(NSArray *)array
{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    NSInteger count = [array count];
    for (int i = 0; i < count; i++) {
        
        id objc = [self modelWithDict:array[i]];
        
        [arr addObject:objc];
    }
    return arr ;
}

@end
