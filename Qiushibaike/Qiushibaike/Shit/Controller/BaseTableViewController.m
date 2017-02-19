//
//  BaseTableViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "BaseTableViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface BaseTableViewController ()

@property (strong, nonatomic) MPMoviePlayerViewController *player;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) CGRect selectedRect;

@end

@implementation BaseTableViewController

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

#pragma mark -懒加载
- (NSMutableArray *)datasource{
    if (!_datasource) {
        self.datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self connectData];
    [self.tableView registerClass:[Pic_content class] forCellReuseIdentifier:@"cell"];
    [self.tableView addFooterWithTarget:self action:@selector(footerAction)];
    [self.tableView addHeaderWithTarget:self action:@selector(headerAction)];

    
}
- (void)connectData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:kExclusiveURL,self.page];
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
        [self.tableView headerEndRefreshing];
        [self.tableView footerEndRefreshing];

    }];
}

#pragma mark - 加载刷新
- (void)footerAction
{
    self.page ++;
    [self connectData];
  
    
    
}
- (void)headerAction{
    self.page = 1;
    [self connectData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (self.isViewLoaded && !self.view.window) {
        self.view = nil;
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.datasource.count;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Pic_content *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ExclusiveModel *model  =self.datasource[indexPath.row];
    [cell configureCellWithModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.commentButton addTarget:self action:@selector(handleCommentButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.commentButton.tag = 1001+indexPath.row;
    [cell.playButton addTarget:self action:@selector(handlePlayButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.playButton.tag = 1002+indexPath.row;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExclusiveModel *model = self.datasource[indexPath.row];
    CGFloat height = model.contentHeight;
    
    if ([model.format isEqualToString:@"image"]) {
        height += (359*model.imageHeight/model.imageaWidth)+65+30+40;
    }
    if ([model.format isEqualToString:@"word"]) {
        height =  model.contentHeight +65+30+40;
    }
    if ([model.format isEqualToString:@"video"]) {
        height += (SCREEN_WIDTH-2*KLeftSpacing )+65+30+40;
    }
    return height;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//        ExclusiveModel *model = self.datasource[indexPath.row];
//        if ([model.format isEqualToString:@"word"]&&[model.format isEqualToString:@"image"]) {
//            NSString *str = [model.identify stringValue];
//            NSString *identity = [NSString stringWithString:str];
//            CommentsViewController *commentVC = [[CommentsViewController alloc]init];
//            commentVC.model = model;
//            commentVC.identity = identity;
//            commentVC.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:commentVC animated:YES];
//            
//        }
//
//}

- (void)handleCommentButton:(UIButton *)sender {
    DLog(@"评论按钮点击");
    ExclusiveModel *model = self.datasource[sender.tag - 1001];
    NSString *str = [model.identify stringValue];
    NSString *identity = [NSString stringWithString:str];
    CommentsViewController *commentVC = [[CommentsViewController alloc]init];
    commentVC.model = model;
    commentVC.identity = identity;
    commentVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:commentVC animated:YES];
}

- (void)handlePlayButtonAction:(UIButton *)sender{
    ExclusiveModel *model = self.datasource[sender.tag-1002];
//    if ([model.format isEqualToString:@"video"]) {
//        DLog(@"视频");
    
        NSString *url = [NSString stringWithFormat:model.high_url];
        NSURL *videoUrl=[NSURL URLWithString:url];
        MPMoviePlayerViewController *movieVc=[[MPMoviePlayerViewController alloc]initWithContentURL:videoUrl];
        //弹出播放器
        [self presentMoviePlayerViewControllerAnimated:movieVc];
        //判断当前是视频的时候
//        UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
//        self.player = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:model.high_url]];
//        self.player.view.frame = CGRectMake(10, model.contentHeight + 65+ 15, SCREEN_WIDTH-2*KLeftSpacing, SCREEN_WIDTH-2*KLeftSpacing);
//        [self.player.moviePlayer setScalingMode:MPMovieScalingModeAspectFit];
//        [self.player.moviePlayer setControlStyle:MPMovieControlStyleEmbedded];
//        [cell addSubview:self.player.view];
    
    
        
//    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
