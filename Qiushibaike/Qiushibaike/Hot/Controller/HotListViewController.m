//
//  HotListViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/20.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "HotListViewController.h"

@interface HotListViewController ()

@end

@implementation HotListViewController

- (instancetype)init{
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"糗友圈" image:[[UIImage imageNamed:@"iconfont-friends-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:nil];
    return self;
}

//- (WMPageController *)p_defaultController{
//    NSArray *viewControllers =@[[HotViewController class],[DayViewController class],];
//    NSArray *titles = @[@"最热",@"精华"];
//    
//    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
//    pageVC.titleSizeSelected = 18;
//    pageVC.pageAnimatable = YES;
//    pageVC.menuViewStyle = WMMenuViewStyleLine;
//    pageVC.titleColorSelected = [UIColor redColor];
//    pageVC.titleColorNormal = [UIColor grayColor];
//    pageVC.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
//    pageVC.itemsWidths = @[@(50),@(50)]; // 这里可以设置不同的宽度
//    
//    return pageVC;
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"糗友圈";
//    WMPageController *PageController = [self p_defaultController];
//    [self addChildViewController:PageController];
//    [self.view addSubview:PageController.view];
    self.view.backgroundColor = [UIColor orangeColor];
}


@end
