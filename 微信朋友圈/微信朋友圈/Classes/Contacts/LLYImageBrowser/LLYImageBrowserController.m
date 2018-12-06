//
//  LLYImageBrowserController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/9/11.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowserController.h"
#import "ImageBrowserCell.h"
@interface LLYImageBrowserController ()

@end

@implementation LLYImageBrowserController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test"]];
//    imageView.frame = CGRectMake(20, 100, 300, 200);
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [imageView addGestureRecognizer:tap];
//    imageView.userInteractionEnabled = YES;
//    [self.view addSubview:imageView];
    [self.tableView registerClass:[ImageBrowserCell class] forCellReuseIdentifier:@"cellImageBrowserId"];
    
}

-(void)tapAction:(UITapGestureRecognizer *)tap{
    
    NSLog(@"%@",tap.view);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 12;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageBrowserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellImageBrowserId"];
    if (!cell) {
        cell = [[ImageBrowserCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellImageBrowserId"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 300;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
