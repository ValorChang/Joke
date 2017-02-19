//
//  MainViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

- (UIViewController *)viewControllerWithClassName:(NSString *)className;//根据类名创建视图控制器.并返回
- (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)rootViewController;//创建一个带指定跟视图控制器对

@end

@implementation MainViewController

#pragma marks -内方法实现
- (UIViewController *)viewControllerWithClassName:(NSString *)className{
    Class currentClass  = NSClassFromString(className);//字符串转成类型
    return [[currentClass alloc]init];
}

- (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)rootViewController{
    return [[UINavigationController alloc]initWithRootViewController:rootViewController];
}




#pragma mark  viewDidload
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *customViewControllers = [NSMutableArray array];//用于存储创建好的视图控制器
    
    NSArray *viewControllerNames = @[@"ShitViewController",@"VideoTableViewController",@"FriendsViewController",@"SetTableViewController"];//视图控制器类名数组
    for (int i = 0; i < 4; i++) {
        UIViewController *viewController = [self viewControllerWithClassName:viewControllerNames[i]];//创建控制器
        UINavigationController *naviVC = [self navigationControllerWithRootViewController:viewController];//给对应的控制器创建导航控制器
        [customViewControllers addObject:naviVC];//将导航控制器添入数组中
        
    }
    //将导航视图控制器数组指定给tabBarController数组属性
    self.viewControllers = customViewControllers;
    self.tabBar.tintColor = [UIColor orangeColor];
    
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
