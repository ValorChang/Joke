//
//  ShitViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "ShitViewController.h"

@interface ShitViewController ()

@end

@implementation ShitViewController



- (instancetype)init{
    self.tabBarItem                  = [[UITabBarItem alloc]initWithTitle:@"热门" image:[[UIImage imageNamed:@"icon_main@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:nil];
    return self;
}

- (WMPageController *)p_defaultController{
    NSArray *viewControllers =@[[ExclusiveTableViewController class],[WeekViewController class],[LastViewController class],[PureWordViewController class],[PurePicViewController class]];
    NSArray *titles                  = @[@"专享",@"最热",@"最新",@"纯文",@"纯图"];

    WMPageController *pageVC         = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    pageVC.titleSizeSelected         = 24;
    pageVC.pageAnimatable            = YES;
    pageVC.titleColorSelected        = [UIColor redColor];
    pageVC.titleColorNormal          = [UIColor grayColor];
    pageVC.progressColor             = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    pageVC.itemsWidths               = @[@(50),@(50),@(50),@(50),@(50)];// 这里可以设置不同的宽度

    return pageVC;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title        = @"热门";
    WMPageController *PageController = [self p_defaultController];
    [self addChildViewController:PageController];
    [self.view addSubview:PageController.view];

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
