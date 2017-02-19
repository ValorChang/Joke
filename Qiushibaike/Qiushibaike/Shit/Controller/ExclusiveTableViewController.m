//
//  ExclusiveTableViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "ExclusiveTableViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface ExclusiveTableViewController ()

@end

@implementation ExclusiveTableViewController




static int i = 1;

#pragma mark -首次加载 界面自动刷新一次-
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (i==1) {
        [self.tableView headerBeginRefreshing];
        i++;
    }
    
    
}
- (void)connectData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:kExclusiveURL,self.page];
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
//        //当数据下载完成时,结束刷新
//        [self.tableView headerEndRefreshing];
//        [self.tableView footerEndRefreshing];
//        //判断如果是下拉刷新,清空数组原有对象
//        if (self.page ==1) {
//            [self.datasource removeAllObjects];
//        }
//        NSArray *itemsArray = [responseObject objectForKey:@"items"];
//        for (NSDictionary *dic in itemsArray) {
//            ExclusiveModel *model = [[ExclusiveModel alloc]init];
//            [model setValuesForKeysWithDictionary:dic];
//            [self.datasource addObject:model];
//        }
//        [self.tableView reloadData];
//        
//    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
//        DLog(@"%@",error);
//    }];
    [super connectData];
}

@end
