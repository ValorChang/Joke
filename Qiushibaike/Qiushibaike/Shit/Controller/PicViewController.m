//
//  PicViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/16.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "PicViewController.h"

@interface PicViewController ()

@end

@implementation PicViewController



- (void)connectData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:kPicURL,self.page];
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


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ExclusiveModel *model = self.datasource[indexPath.row];
//    if ([model.format isEqualToString:@"word"]) {
//        DLog(@"文本");
//        NSString *str = [model.identify stringValue];
//        NSString *identity = [NSString stringWithString:str];
//        CommentsViewController *commentVC = [[CommentsViewController alloc]init];
//        commentVC.model = model;
//        commentVC.identity = identity;
//        commentVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:commentVC animated:YES];
//        
//    }
//    if ([model.format isEqualToString:@"video"]) {
//        DLog(@"视频");
//        NSString *url = [NSString stringWithFormat:model.high_url];
//        NSURL *videoUrl=[NSURL URLWithString:url];
//        MPMoviePlayerViewController *movieVc=[[MPMoviePlayerViewController alloc]initWithContentURL:videoUrl];
//        //弹出播放器
//        [self presentMoviePlayerViewControllerAnimated:movieVc];
//        
//    }
//    
//}

//
//- (void)handleCommentButtonAction:(id)sender event:(id)event{
//    NSSet *touches =[event allTouches];
//    UITouch *touch =[touches anyObject];
//    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
//    
//    NSIndexPath *indexPath = [self.tableView  indexPathForRowAtPoint:currentTouchPosition];
//    ExclusiveModel *model = self.datasource[indexPath.row];
//    
//    if ([model.format isEqualToString:@"word"]) {
//        DLog(@"文本");
//        NSString *str = [model.identify stringValue];
//        NSString *identity = [NSString stringWithString:str];
//        CommentsViewController *commentVC = [[CommentsViewController alloc]init];
//        commentVC.model = model;
//        commentVC.identity = identity;
//        commentVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:commentVC animated:YES];
//        
//    }
//    if ([model.format isEqualToString:@"image"]){
//        DLog(@"图片");
//        NSString *str = [model.identify stringValue];
//        NSString *identity = [NSString stringWithString:str];
//        CommentsViewController *commentVC = [[CommentsViewController alloc]init];
//        commentVC.model = model;
//        commentVC.identity = identity;
//        commentVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:commentVC animated:YES];
//    }
//    if ([model.format isEqualToString:@"video"]) {
//        NSString *str = [model.identify stringValue];
//        NSString *identity = [NSString stringWithString:str];
//        CommentsViewController *commentVC = [[CommentsViewController alloc]init];
//        commentVC.model = model;
//        commentVC.identity = identity;
//        commentVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:commentVC animated:YES];
//    }
//    
//    
//}



@end
