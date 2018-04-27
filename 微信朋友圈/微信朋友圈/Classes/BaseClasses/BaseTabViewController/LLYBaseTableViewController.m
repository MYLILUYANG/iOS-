//
//  LLYBaseTableViewController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYBaseTableViewController.h"

@interface LLYBaseTableViewController ()

@end

@implementation LLYBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [LHPerformanceMonitorService run];
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
    }
    return _dataArray;
}

@end
