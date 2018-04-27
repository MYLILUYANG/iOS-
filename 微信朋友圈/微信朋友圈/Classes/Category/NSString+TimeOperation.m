//
//  NSString+TimeOperation.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/8.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "NSString+TimeOperation.h"

@implementation NSString (TimeOperation)
+(NSString *)howLongFromNow:(NSString *)pastTime
{
    
    //把字符串转为NSdate
    
    NSDate  *dateInterval = [NSDate dateWithTimeIntervalSince1970:[pastTime doubleValue]];
    
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//
//    NSDate *timeDate = [dateFormatter dateFromString:dateFormatter];
    
    //得到与当前时间差
    
    NSTimeInterval timeInterval = [dateInterval timeIntervalSinceNow];
    
    timeInterval = -timeInterval;
    
    long temp = 0;
    
    NSString *result;
    
    if (timeInterval < 60) {
        
        result = [NSString stringWithFormat:@"刚刚"];
        
    }else if((temp = timeInterval/60) <60){
        
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
        
    }else if((temp = temp/60) <24){
        
        result = [NSString stringWithFormat:@"%ld小时前",temp];
        
    }else if((temp = temp/24) <30){
        
        result = [NSString stringWithFormat:@"%ld天前",temp];
        
    }else if((temp = temp/30) <12){
        
        result = [NSString stringWithFormat:@"%ld月前",temp];
        
    }else{
        
        temp = temp/12;
        
        result = [NSString stringWithFormat:@"%ld年前",temp];
        
    }
    
    return  result;
 
}
@end
