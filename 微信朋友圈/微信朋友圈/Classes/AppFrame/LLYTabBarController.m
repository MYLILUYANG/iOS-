//
//  LLYTabBarController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYTabBarController.h"
#import "LLYHomeController.h"
#import "LLYContactController.h"
#import "LLYDiscoverController.h"
#import "LLYMineController.h"
#import "LLYBaseNavigationController.h"

#define kClass @"RootClaccController"
#define kTitle @"title"
#define kIcon_N @"icon_Normal"
#define kIcon_Sel @"icon_sel"

@interface LLYTabBarController ()

@end

@implementation LLYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *childrenItemsArray = @[
                                    @{  kClass:@"LLYHomeController",
                                        kTitle:@"微信",
                                        kIcon_N:@"tabbar_mainframe",
                                        kIcon_Sel:@"tabbar_mainframeHL"
                                      },
                                    @{kClass:@"LLYContactController",
                                       kTitle:@"通讯录",
                                       kIcon_N:@"tabbar_contacts",
                                       kIcon_Sel:@"tabbar_contactsHL"},
                                    @{kClass:@"LLYDiscoverController",
                                        kTitle:@"发现",
                                        kIcon_N:@"tabbar_discover",
                                        kIcon_Sel:@"tabbar_discoverHL"},
                                    @{kClass:@"LLYMineController",
                                        kTitle:@"我",
                                        kIcon_N:@"tabbar_me",
                                        kIcon_Sel:@"tabbar_meHL"}
                                    ];
    
    [childrenItemsArray enumerateObjectsUsingBlock:^( NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *controller = [NSClassFromString(dict[kClass]) new];
        
        controller.title = dict[kTitle];
        LLYBaseNavigationController *Nav = [[LLYBaseNavigationController alloc] initWithRootViewController:controller];
        
        Nav.tabBarItem.image = [UIImage imageNamed:dict[kIcon_N]];
        Nav.tabBarItem.selectedImage = [[UIImage imageNamed:dict[kIcon_Sel]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        Nav.title = dict[kTitle];
        [Nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
        [self addChildViewController:Nav];
    }];
    
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
