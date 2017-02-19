//
//  CommentsViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/18.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController ()

@end

@implementation CommentsViewController

- (NSMutableArray *)datasArr{
    if (!_datasArr) {
        _datasArr = [[NSMutableArray alloc]init];
    }
    return _datasArr;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.tableFooterView=[[UIView alloc]init];
    [self.tableView registerClass:[CommentsViewCell class] forCellReuseIdentifier:@"cell2"];
    self.tableView.frame = CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.navigationItem.title = @"评论";
}


- (void)connectData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:kDetailsURL,self.identity,self.page];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        //当数据下载完成时,结束刷新
        [self.tableView headerEndRefreshing];
        [self.tableView footerEndRefreshing];
        //判断如果是下拉刷新,清空数组原有对象
                if (self.page ==1) {
        [self.datasArr removeAllObjects];
        
                }
        
        NSArray *itemsArray = [responseObject objectForKey:@"items"];
        for (NSDictionary *dic in itemsArray) {
            CommentsModel *model = [[CommentsModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [self.datasArr addObject:model];
            
//            UserModel *userModel = [[UserModel alloc]init];
//             [userModel setValuesForKeysWithDictionary:dic];
//            [self.datasArr addObject:userModel];

        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        DLog(@"%@",error);
    }];
}

#pragma mark - 加载刷新
- (void)footerAction
{
    self.page ++;
    [self connectData];
    
    
    
}
- (void)headerAction{
    self.page =1;
    [self connectData];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ExclusiveModel *model = self.model;


    CGFloat height = model.contentHeight;


    
    if (indexPath.section ==0) {
 
        if ([model.format isEqualToString:@"image"]) {
            height += (359*model.imageHeight/model.imageaWidth)+65+30+30;
        }
        if ([model.format isEqualToString:@"word"]) {
            height =  model.contentHeight +65+30+30;
        }
        if ([model.format isEqualToString:@"video"]) {
            height += (SCREEN_WIDTH-2*KLeftSpacing )+65+30+30;
        }
        
    }
    if (indexPath.section ==1) {
        CommentsModel *model2 = self.datasArr[indexPath.row];
        height = model2.commentsHeight+55;
        
    }
   
    return height;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 1;
    }
    return self.datasArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(indexPath.section ==0){
        Pic_content *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        ExclusiveModel *model = self.model;
        [cell configureCellWithModel:model];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
    CommentsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        CommentsModel *model = self.datasArr[indexPath.row];
        [cell configureCellWithModel:model];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if ([self.model.format isEqualToString:@"video"]) {
//        NSString *url = [NSString stringWithFormat:self.model.high_url];
//        NSURL *videoUrl=[NSURL URLWithString:url];
//        MPMoviePlayerViewController *movieVc=[[MPMoviePlayerViewController alloc]initWithContentURL:videoUrl];
//        //弹出播放器
//        [self presentMoviePlayerViewControllerAnimated:movieVc];
//        
//        
//        
//    }
//    
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
