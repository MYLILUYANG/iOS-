//
//  RuntimeController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/27.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "RuntimeController.h"
#import "Person.h"
#import <objc/message.h>
#import "NSObject+Category.h"
#import "NSString+attribute.h"
@interface RuntimeController ()
@property (nonatomic, copy) UILabel  *msgLabel;
@property (nonatomic, strong) UILabel *descLabel;
@end

@implementation RuntimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    //    -————用法1————————————————————————————————————————————————————————————————————
    //      1  将某些OC代码转为运行时代码，探究底层。
    //    [self msgSend];
    
    
    
    
    //    -————用法2————————————————————————————————————————————————————————————————————
    //      2 拦截系统方法   我们创建一个分类拦截系统的URLWithString 方法   方法swizing
    //      案例 假设一个场景 : 后台返回给我们的头像URL 有一个中文或者 有一个空格 ，我们不能一个一个查找string转URL 的方法做判断是否string复合规定，所以想个办法吧系统的方法换成我们自己的方法，做string判断处理。
//        [self swizing];

    
    //    -————用法3————————————————————————————————————————————————————————————————————
    //    给类添加属性    给NSString 增加一个名为 haha的属性
//    [self addAttribut];
    
    
    //    -————用法4————————————————————————————————————————————————————————————————————
    //    实现自动归解档
    
//    [self autoEncode];
    
//    字典模型转换
//    [self modelExtension];
    
    
//    -————————————————————————————————————————————————————————————————————————
//    NetWork Test
//    [self testUI];
}

-(void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    _descLabel = [[UILabel alloc] init];
    _descLabel.numberOfLines = 0;
    _descLabel.backgroundColor = K_RandColor;
    _descLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_descLabel];
    
 
    
    
    
    UIButton *button0 = [self addBtn:@"消息发送" sel:@selector(msgSend)];
    UIButton *button1 = [self addBtn:@"拦截系统方法 需要在load的手 设置" sel:@selector(swizing)];
    UIButton *button2 = [self addBtn:@"给类添加属性" sel:@selector(addAttribut)];
    UIButton *button3 = [self addBtn:@"实现自动归解档" sel:@selector(autoEncode)];
    UIButton *button4 = [self addBtn:@"字典模型转换" sel:@selector(modelExtension)];
    
    
    
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
    
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(button3.mas_bottom).offset(20);
        make.left.mas_equalTo(button3);
        make.right.mas_equalTo(button3);
        make.height.equalTo([NSNumber numberWithFloat:K_Height(40)]);
        
    }];
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(button4.mas_bottom).offset(20);
        make.left.mas_equalTo(button4);
        make.right.mas_equalTo(button4);
        make.height.equalTo([NSNumber numberWithFloat:K_Height(80)]);
    }];
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

-(void)modelExtension
{
//数据源
    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:@"男",@"sex",@"23",@"age",@"李一铭",@"name", nil];
    NSDictionary *data1 = [NSDictionary dictionaryWithObjectsAndKeys:@"女",@"sex",@"27",@"age",@"王志勇",@"name", nil];
    NSDictionary *data2 = [NSDictionary dictionaryWithObjectsAndKeys:@"男",@"sex",@"20",@"age",@"大树",@"name", nil];
    NSDictionary *data3 = [NSDictionary dictionaryWithObjectsAndKeys:@"男",@"sex",@"13",@"age",@"张三",@"name", nil];
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:data, data1, data2, data3, nil];
    
//    转换模型
    NSArray *array = [Person modelsWithArray:[dataArray copy]];
    Person *p0 = array[0];
    Person *p1 = array[1];
    Person *p2 = array[2];
    Person *p3 = array[3];
    self.descLabel.text = [NSString stringWithFormat:@"p0.name = %@ p0.age = %d  p0.sex = %@ \n p1.name = %@ p1.age = %d  p1.sex = %@ \n p2.name = %@ p2.age = %d  p2.sex = %@ \n p2.name = %@ p2.age = %d  p2.sex = %@",p0.name, p0.age,p0.sex,p1.name, p1.age,p1.sex,p2.name, p2.age,p2.sex,p3.name, p3.age,p3.sex];


}



-(void)autoEncode
{
    
//    归解档操作是对象需要要遵守nscoding协议 。
    
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"testData.data"];
    NSLog(@"%@",filePath);
    
    Person *p = [Person new];
    p.name = @"张三";
    p.nickName = @"小三";
    p.age = 30;
//归档到一个目录
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
    
//从一个目录解档
    Person *p1 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    self.descLabel.text = [NSString stringWithFormat:@" 归档地址为:%@ \n name = %@ nickName = %@ age = %d",filePath,p1.name, p1.nickName, p1.age];
    NSLog(@"name = %@ nickName = %@ age = %d",p1.name, p1.nickName, p1.age);

}

-(void)addAttribut
{
    
    NSString *a = @"jjjj";
    a.haha = @"我是 NSString 的新属性haha";
    NSLog(@"%@",a.haha);
    self.descLabel.text = [NSString stringWithFormat:@"NSString 新增的属性: a.haha = %@",a.haha];
    
}

-(void)swizing
{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(-10);
        make.left.equalTo(@10);
        make.width.equalTo(@100);
        make.height.equalTo(@150);
        
    }];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        如果url中有空格，我们会先想到使用一个分类  用自己的方法，这也是一个好办法，但是如果项目中有很多处都需要替换那我们可能会是使用runtime机制 替换系统的方法 。
//        具体做法 1 新建一个NSURL+swizing
//               2  我们现在考虑应该在什么地方替换系统的方法，在项目最早的时候，就是加载文件的地方 load方法
        
        NSString *urlStr = @"h  ttp://ww   w.tao pic.com/ uploads/alli  mg/1 40322/235 058-1403220K93    993.jpg";

        NSURL *url = [NSURL URLWithString:urlStr];
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.descLabel.text = [NSString stringWithFormat:@"swizing 前url：%@ \n swizing 后url：%@ ",urlStr, url];
            
            imageView.image = image;
        });
    }) ;
}
-(void)msgSend
{
    Person *p = [[Person alloc] init];
    
    [p eat:@"玉米"];
    [p performSelector:@selector(eat:) withObject:@"花生"];
//    方法的调用实质是 objc_msgSend()
    objc_msgSend(p, @selector(eat:),@"包子");
    
    
    self.descLabel.text = @"方法的调用实质是消息发送 objc_msgSend()";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
