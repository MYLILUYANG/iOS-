//
//  OpenGLESController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/5/4.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "OpenGLESController.h"
#import <GLKit/GLKit.h>
#import "MyBlogController.h"
@interface OpenGLESController ()<UITableViewDelegate ,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation OpenGLESController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, K_ScreenW, K_ScreenH) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _dataArray = @[@"Mac 搭建OpenGL换将 c++  glfw  glad ", @"hello 窗口"];
    [self.view addSubview:_tableView];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *loadStr = @"";
    if (indexPath.row == 0) {
        loadStr = @"https://www.jianshu.com/p/891d630e30af";
    }else if(indexPath.row == 1){
        loadStr = @"https://www.jianshu.com/p/c19837528ffb";
    }
    MyBlogController *controller = [[MyBlogController alloc] init];
    controller.loadURLString = loadStr;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
