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
@property (nonatomic, strong) NSArray<NSString *> *imagesArray;
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
    _imagesArray = @[@"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                     @"http://ww2.sinaimg.cn/bmiddle/642beb18gw1ep3629gfm0g206o050b2a.gif",
                     @"http://ww4.sinaimg.cn/bmiddle/9e9cb0c9jw1ep7nlyu8waj20c80kptae.jpg",
                     @"http://ww3.sinaimg.cn/bmiddle/8e88b0c1gw1e9lpr1xydcj20gy0o9q6s.jpg",
                     @"http://ww2.sinaimg.cn/bmiddle/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                     @"http://ww4.sinaimg.cn/bmiddle/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
                     @"http://ww3.sinaimg.cn/bmiddle/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg",
                     @"http://ww2.sinaimg.cn/bmiddle/677febf5gw1erma104rhyj20k03dz16y.jpg",
                     ];
    [self.tableView registerClass:[ImageBrowserCell class] forCellReuseIdentifier:@"cellImageBrowserId"];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageBrowserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellImageBrowserId"];
    if (!cell) {
        cell = [[ImageBrowserCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellImageBrowserId"];
    }
    cell.modelArray = _imagesArray;
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
