//
//  FriendsViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/21.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "FriendsViewController.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController

- (instancetype)init{
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"糗友圈" image:[[UIImage imageNamed:@"iconfont-pengyouquan-3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:nil];
    return self;
}

- (void)connectData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:kFriendsURL,self.page];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {

        //当数据下载完成时,结束刷新
        [self.tableView headerEndRefreshing];
        [self.tableView footerEndRefreshing];
        
        //判断如果是下拉刷新,清空数组原有对象
        if (self.page ==1) {
            [self.datasource removeAllObjects];
            
        }
        
        NSArray *dataArray = [responseObject objectForKey:@"data"];
        for (NSDictionary *dic in dataArray) {
            FriendsModel *model = [[FriendsModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            
            [self.datasource addObject:model];
            
            
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        DLog(@"%@",error);
    }];
}

- (void)footerAction
{
    self.page ++;
    [self connectData];
    
    
    
}
- (void)headerAction{
    self.page =1;
    [self connectData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"糗友圈";
    [self.tableView registerClass:[FriendsCell class] forCellReuseIdentifier:@"cell"];

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendsModel *model = self.datasource[indexPath.row];
    CGFloat height = model.contentHeight;
    
   
    height =  model.contentHeight + 65 + 20;
    
      return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    FriendsModel *model  =self.datasource[indexPath.row];
    [cell configureCellWithModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
