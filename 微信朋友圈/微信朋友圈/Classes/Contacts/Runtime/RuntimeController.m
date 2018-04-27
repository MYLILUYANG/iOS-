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

@interface RuntimeController ()

@end

@implementation RuntimeController

- (void)viewDidLoad {
    [super viewDidLoad];
//    需要先引入 <objc/message>
    self.view.backgroundColor = [UIColor whiteColor];
    
    //      1  将某些OC代码转为运行时代码，探究底层。
//    [self msgSend];
    //      2 拦截系统方法   我们创建一个分类拦截系统的URLWithString 方法   方法swizing
    //      案例 假设一个场景 : 后台返回给我们的头像URL 有一个中文或者 有一个空格 ，我们不能一个一个查找string转URL 的方法做判断是否string复合规定，所以想个办法吧系统的方法换成我们自己的方法，做string判断处理。
    
//    [self swizing];
    
    
    
//    -————————————————————————————————————————————————————————————————————————
    
    

//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
//    manager.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];//申明返回的结果是json类型
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];//如果接受类型不一致请替换一致
//
//    [manager.requestSerializer setValue:@"text/html; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *dict = @{@"name":@"aaa", @"pwd": @"123"};
    NSLog(@"%@",dict);
    [manager POST:@"http://192.168.10.169:8000/ht/" parameters:@{@"name":@"aaa", @"pwd": @"123", @"asdf":@"123"} progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
    
    
//    [manager GET:@"http://192.168.10.169:8000/ht/" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"%@",downloadProgress);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error.localizedDescription);
//    }];
    
}
-(void)swizing
{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@70);
        make.left.equalTo(@10);
        make.width.equalTo(@100);
        make.height.equalTo(@150);
        
    }];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        如果url中有空格，我们会先想到使用一个分类  用自己的方法，这也是一个好办法，但是如果项目中有很多处都需要替换那我们可能会是使用runtime机制 替换系统的方法 。
//        具体做法 1 新建一个NSURL+swizing
//               2  我们现在考虑应该在什么地方替换系统的方法，在项目最早的时候，就是加载文件的地方 load方法
        
        NSString *urlStr = @"http://www.taopic.com/uploads/alli  mg/140322/235058-1403220K93993.jpg";
        NSURL *url = [NSURL URLWithString:urlStr];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
