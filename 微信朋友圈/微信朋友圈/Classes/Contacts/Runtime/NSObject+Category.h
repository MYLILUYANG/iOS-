//
//  NSObject+Category.h
//  微信朋友圈
//
//  Created by liluyang on 2018/5/8.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)

+(instancetype)modelWithDict:(NSDictionary *)dict;

+(NSArray *)modelsWithArray:(NSArray *)array;

@end
