//
//  TestViewController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "ImageBroserViewController.h"
#import "ImageBrowserCell.h"
#import "LLYImageBrowser/LLYImageModel.h"
@interface ImageBroserViewController ()

@property (nonatomic, strong) NSArray<LLYImageModel *> *imagesArray0;
@property (nonatomic, strong) NSArray<LLYImageModel *> *imagesArray1;
@property (nonatomic, strong) NSArray<LLYImageModel *> *imagesArray2;
@property (nonatomic, strong) NSArray<LLYImageModel *> *imagesArray3;
@property (nonatomic, strong) NSArray<LLYImageModel *> *imagesArray4;
@property (nonatomic, strong) NSDictionary *dict;
@end

@implementation ImageBroserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLYImageModel *model0 = [[LLYImageModel alloc] init];
    model0.url = [NSURL URLWithString:@"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg"];
    
    LLYImageModel *model1 = [[LLYImageModel alloc] init];
    model1.url = [NSURL URLWithString:@"http://ww2.sinaimg.cn/bmiddle/642beb18gw1ep3629gfm0g206o050b2a.gif"];
    
    LLYImageModel *model2 = [[LLYImageModel alloc] init];
    model2.url = [NSURL URLWithString:@"http://ww4.sinaimg.cn/bmiddle/9e9cb0c9jw1ep7nlyu8waj20c80kptae.jpg"];
    
    LLYImageModel *model3 = [[LLYImageModel alloc] init];
    model3.url = [NSURL URLWithString:@"http://ww3.sinaimg.cn/bmiddle/8e88b0c1gw1e9lpr1xydcj20gy0o9q6s.jpg"];
    
    LLYImageModel *model4 = [[LLYImageModel alloc] init];
    model4.url = [NSURL URLWithString:@"http://ww2.sinaimg.cn/bmiddle/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg"];
    
    LLYImageModel *model5 = [[LLYImageModel alloc] init];
    model5.url = [NSURL URLWithString:@"http://ww4.sinaimg.cn/bmiddle/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg"];
    
    
    _imagesArray0 = @[model5];
    _imagesArray1 = @[model1,model2];
    _imagesArray2 = @[model1,model2,model3,];
    _imagesArray3 = @[model1,model2,model3,model4,];
    _imagesArray4 = @[model1,model2,model3,model4,model5];
    
    NSDictionary *dict = @{@"key0":self.imagesArray0,@"key1":self.imagesArray1,@"key2":self.imagesArray2,@"key3":self.imagesArray3,@"key4":self.imagesArray4};
    _dict = dict;

    [self.tableView registerClass:[ImageBrowserCell class] forCellReuseIdentifier:@"cellImageBrowserId"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dict.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageBrowserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellImageBrowserId"];
    if (!cell) {
        cell = [[ImageBrowserCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellImageBrowserId"];
    }
    NSArray *keys = self.dict.allKeys;
    cell.modelArray = self.dict[keys[indexPath.row]];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ImageBrowserCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%.2f",cell.cellHeight);
    return 150;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"__func  =========== %s",__func__);
}


@end
