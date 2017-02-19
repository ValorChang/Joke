//
//  DayViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/20.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "DayViewController.h"

@interface DayViewController ()

@end

@implementation DayViewController

- (void)connectData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:kDayURL,self.page];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        //当数据下载完成时,结束刷新
        [self.tableView headerEndRefreshing];
        [self.tableView footerEndRefreshing];
        
        //判断如果是下拉刷新,清空数组原有对象
        if (self.page ==1) {
            [self.datasource removeAllObjects];
            
        }
        
        NSArray *itemsArray = [responseObject objectForKey:@"items"];
        for (NSDictionary *dic in itemsArray) {
            ExclusiveModel *model = [[ExclusiveModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [self.datasource addObject:model];
            
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        DLog(@"%@",error);
    }];
}
@end
