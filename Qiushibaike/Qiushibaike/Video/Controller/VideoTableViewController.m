//
//  VideoTableViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/16.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "VideoTableViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface VideoTableViewController ()

@end

@implementation VideoTableViewController

- (instancetype)init{
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"视频" image:[[UIImage imageNamed:@"iconfont-shipin-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:nil];
    return self;
}

//首次加载 界面自动刷新一次,i用来标记界面是否是首次加载
static int i = 1;

#pragma mark -首次加载 界面自动刷新一次-
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (i==1) {
        [self.tableView headerBeginRefreshing];
        i++;
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"视频";

}


- (void)connectData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:kVideoURL,self.page];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    }


- (void)handleCommentButtonAction:(id)sender event:(id)event{
    
    NSSet *touches =[event allTouches];
    UITouch *touch =[touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView  indexPathForRowAtPoint:currentTouchPosition];
    ExclusiveModel *model = self.datasource[indexPath.row];
    
    if ([model.format isEqualToString:@"word"]) {
        DLog(@"文本");
        NSString *str = [model.identify stringValue];
        NSString *identity = [NSString stringWithString:str];
        CommentsViewController *commentVC = [[CommentsViewController alloc]init];
        commentVC.model = model;
        commentVC.identity = identity;
        commentVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:commentVC animated:YES];
        
    }
    if ([model.format isEqualToString:@"image"]){
        DLog(@"图片");
        NSString *str = [model.identify stringValue];
        NSString *identity = [NSString stringWithString:str];
        CommentsViewController *commentVC = [[CommentsViewController alloc]init];
        commentVC.model = model;
        commentVC.identity = identity;
        commentVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:commentVC animated:YES];
    }
    if ([model.format isEqualToString:@"video"]) {
        NSString *str = [model.identify stringValue];
        NSString *identity = [NSString stringWithString:str];
        CommentsViewController *commentVC = [[CommentsViewController alloc]init];
        commentVC.model = model;
        commentVC.identity = identity;
        commentVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:commentVC animated:YES];
    }
    
    
}


@end
