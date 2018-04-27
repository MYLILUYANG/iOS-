//
//  LLYDiscoverController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYDiscoverController.h"
#import "LLYTimeLineController.h"
@interface LLYDiscoverController ()

@end

@implementation LLYDiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = false;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {

    }
    return [[UIStoryboard storyboardWithName:@"LLYDiscoverController" bundle:nil] instantiateInitialViewController];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[LLYTimeLineController class]]) {
        self.tabBarController.tabBar.hidden = true;
    }
}

@end
