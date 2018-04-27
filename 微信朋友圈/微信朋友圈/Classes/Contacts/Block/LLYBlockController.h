//
//  LLYBlockController.h
//  微信朋友圈
//
//  Created by liluyang on 2018/4/27.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLYBlockController : UIViewController

//用法1  类的属性  向上一个界面传值
@property (nonatomic, strong) void (^myBlock)(id a);
@property (nonatomic, strong) void (^myBlock1)(id b);
@property (nonatomic, strong) void (^myBlock2)(id c);


//用法2 方法的参数    函数式编程思想
//Masonry 中  mas_makeConstraints:^(MASConstraintMaker *make) {}  就使用的是这种方式
-(void)eat:(void (^)(NSString *food))foodBlock;

//用法3  方法的返回值
-(void (^)(int m))run;

/**
 延伸   链式编程思想   只能是getter 方法. 因为只有getter方法才能使用点语法
 Block 作为函数的返回值 ，Block 自身仍有返回值。  精彩用法请参照 Masonry  本类中button 约束方式使用的是Masonry
 make.top.equalTo(@70); 这句代码 体现了链式编程思想。
 */
-(LLYBlockController *(^)(NSString *))drink;
-(LLYBlockController *(^)(NSString *))work;

/**
 截获自动变量值
 Block 的定义是“带有自动变量值的匿名函数”  自动变量值究竟是什么呢？
 */


@end
