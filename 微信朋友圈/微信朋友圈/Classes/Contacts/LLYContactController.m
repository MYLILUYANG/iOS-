//
//  LLYContactController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYContactController.h"
#import "LLYBlockController.h"
#import "RuntimeController.h"
@interface LLYContactController ()
@property (nonatomic, strong) NSArray *addDataArray;
@end

@implementation LLYContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

-(void)loadData
{
    
    _addDataArray = @[@"Block 用法", @"Runtime 使用", @"GCD 使用详解", @"Sockets 使用"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _addDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
        
    }
    cell.textLabel.text = _addDataArray[indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        
        LLYBlockController *blockController = [[LLYBlockController alloc] init];
// 一       属性传值
        blockController.myBlock = ^(id a) {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"接收到的传值:%@",a];
        };
// 二       方法的参数 函数式编程
        [blockController eat:^(NSString *food) {
            NSLog(@"吃了:%@",food);
        }];
// 三       方法的返回值 是一个block   链式编程思想
        [blockController run](10);
        blockController.run(10);
        blockController.drink(@"果粒橙").work(@"工作总结");

        [self.navigationController pushViewController:blockController animated:YES];
    }else if (indexPath.row == 1){
        
        RuntimeController *runtimeController = [[RuntimeController alloc] init];
        
        [self.navigationController pushViewController:runtimeController animated:YES];
    }
}






@end
