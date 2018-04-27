//
//  LLYBlockController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/27.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYBlockController.h"
#import "MyBlogController.h"
@interface LLYBlockController ()


@end

@implementation LLYBlockController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupView];
    
    /**
     Block 详解
     截获自动变量值
     Block 的定义是“带有自动变量值的匿名函数”  自动变量值究竟是什么呢？
     */
    [self interceptVal];

}

-(void)interceptVal
{
    // 一 Block 会保存外部变量瞬间的值 ， 调用顺序不影响Block 截获的变量的值。
    int a = 10;
    void (^myBlock)(void) = ^{
        NSLog(@"a = %d ",a );
        NSLog(@"%d",MAX(a, 1));  //无法对a 赋值 但是可以使用a 做事情。
    };
    a = 30;
    myBlock();
    
    //    输出结果为  a = 10, b = 20
    
    //    ----------------------------------------------------------------------------------------
    /**
     实际上，自动变量值截获只能保存执行Block 语法瞬间的值，保存后就不能改写。
     如果想要在Block 语法的表达式中将值赋给在Block 外声明的自动变量，需要在该自动变量前附加 __block
     */
    
    __block int b = 10;
    
    void (^myBlock1)(void) = ^{
        b = 30;
    };
    
    myBlock1();
    
    NSLog(@"%d",b);
    
    //    输出结果为 30
    //    ----------------------------------------------------------------------------------------
//    截获的变量无法修改变量的值，那么向截获的Objective-C 对象 赋值也会产生编译错误码？
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    void(^myBlock2)(void) = ^(){
        [array addObject:@"1"];
//        array = [[NSMutableArray alloc] init];   // 会产生编译错误 Variable is not assignable (missing __block type specifier)
    };
    myBlock2();
    //    我们发现是可以使用NSMutableArray  的方法。
    //    原因就是:Block截获的是 NSMutableArray 的结构体实例指针，赋值给array的操作会产生编译错误，但是使用截获的值却不会有任何问题。
    
}

-(void)setupView
{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button0 = [self addBtn:@"点击向上一个界面传值" sel:@selector(popAction)];
    UIButton *button1 = [self addBtn:@"作为方法参数 请看源码" sel:nil];
    UIButton *button2 = [self addBtn:@"作为方法返回值 请看源码" sel:nil];
    
    UIButton *button3 = [self addBtn:@"查看我的简书" sel:@selector(toMyLog)];
    
    
    [button0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@70);
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.height.equalTo([NSNumber numberWithFloat:K_Height(40)]);
    }];
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(button0.mas_bottom).offset(20);
        make.left.mas_equalTo(button0);
        make.right.mas_equalTo(button0);
        make.height.equalTo([NSNumber numberWithFloat:K_Height(40)]);
        
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(button1.mas_bottom).offset(20);
        make.left.mas_equalTo(button1);
        make.right.mas_equalTo(button1);
        make.height.equalTo([NSNumber numberWithFloat:K_Height(40)]);
        
    }];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(button2.mas_bottom).offset(20);
        make.left.mas_equalTo(button2);
        make.right.mas_equalTo(button2);
        make.height.equalTo([NSNumber numberWithFloat:K_Height(40)]);
    }];
}

-(void)toMyLog
{
    MyBlogController *blog = [[MyBlogController alloc] init];
    blog.loadURLString = @"https://www.jianshu.com/p/35d195924b99";
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:blog animated:YES];
}

-(UIButton *)addBtn:(NSString *)title sel:(SEL)sel{
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    button.backgroundColor = K_RandColor;
    
    button.layer.cornerRadius = 5;
    
    button.layer.masksToBounds = YES;
    
    [self.view addSubview:button];
    return button;
}

-(void)popAction
{
    //    1 类的属性 向前传值。
    self.myBlock([NSNumber numberWithInt:arc4random()%100]);
    [self.navigationController popViewControllerAnimated:YES];
    
}
//方法的参数  函数式编程
-(void)eat:(void (^)(NSString *))foodBlock
{
    foodBlock(@"煎饼果子");
}
//函数的返回值
-(void (^)(int))run
{
    return ^(int a){
        NSLog(@"跑了%d米",a);
    };
}

/**
 Block 作为函数的返回值 ，Block 自身仍有返回值。
 */
-(LLYBlockController *(^)(NSString *drink))drink
{
    return ^(NSString *drink){
        NSLog(@"喝了：%@",drink);
        return self;
    };
}

-(LLYBlockController *(^)(NSString *work))work
{
    return ^(NSString * work){
        NSLog(@"今天的工作是：%@",work);
        return self;
    };
}


@end
