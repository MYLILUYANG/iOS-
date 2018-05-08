//
//  Person.h
//  微信朋友圈
//
//  Created by liluyang on 2018/4/27.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString *sex;





-(void)eat:(NSString *)food;
@end
