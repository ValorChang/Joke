//
//  BaseTableViewController.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *datasource;
@property (nonatomic,assign) NSInteger page;


- (void)connectData;
@end
