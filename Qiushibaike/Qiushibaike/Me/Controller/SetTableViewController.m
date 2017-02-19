//
//  SetTableViewController.m
//  汽车之家框架Demo
//
//  Created by xalo on 15/10/21.
//  Copyright (c) 2015年 itzyd. All rights reserved.
//

#import "SetTableViewController.h"
#import "SetModel.h"
#import "SetTableViewCell.h"

#import "SDImageCache.h"
#import "SDWebImageManager.h"


@interface SetTableViewController ()
@property (nonatomic, strong)NSMutableArray *datasource;

@end

@implementation SetTableViewController



-(NSMutableArray *)datasource{
    if (!_datasource) {
        self.datasource=[NSMutableArray array];
    }
    return _datasource;
}

+(float)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}

- (instancetype)init{
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"设置" image:[[UIImage imageNamed:@"icon_setting"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:nil];
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.navigationItem.title = @"设置";
    [self.tableView registerClass:[SetTableViewCell class] forCellReuseIdentifier:@"CELL_SET" ];
    self.tableView.rowHeight = 80;
    [self loadDatasource]; 
}

- (void)loadDatasource{
    NSString *sourcePath=[[NSBundle mainBundle] pathForResource:@"Set_Name" ofType:@"plist"];
    NSArray *suorceArray=[NSArray arrayWithContentsOfFile:sourcePath];
    
    for (NSDictionary *dic in suorceArray) {
        SetModel *model=[[SetModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.datasource addObject:model];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.datasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backgroundpic.jpg"]];
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
    return imageView;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_SET" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    SetModel *model = self.datasource[indexPath.row];
    cell.setImage.image = [UIImage imageNamed:model.image];
    cell.LabelTitel.text = model.title;
    cell.subLabel.text=model.subtitle;
    if (indexPath.row==0) {
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    //计算已缓存的图片大小
    CGFloat _temSize=[[SDImageCache sharedImageCache]getSize]/1024.0/1024.0;
    label.text=[NSString stringWithFormat:@"     %.2fM",_temSize];

    label.font=[UIFont systemFontOfSize:15];
    cell.accessoryView=label;
    }
    
    return cell;
}





-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
     if (indexPath.row==0){
        UIAlertView *baseAlert = [[UIAlertView alloc]
                                  initWithTitle:@"清除缓存" message:@"确认清除缓存?"
                                  delegate:self cancelButtonTitle:@"取消"
                                  otherButtonTitles:@"确认", nil];
      
        [baseAlert show];
      
    }else if (indexPath.row==1){
//        [self.navigationController pushViewController:aboutUsVC animated:YES];

        UIAlertView *baseAlert2 = [[UIAlertView alloc]
                                  initWithTitle:@"糗事新热榜" message:@"版本号:v1.0\n\n作者：常迪"
                                  delegate:nil cancelButtonTitle:@"取消"
                                  otherButtonTitles:@"确认", nil];

        [baseAlert2 show];


    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1){
        [[SDImageCache sharedImageCache]clearDisk];
        [self.tableView reloadData];
    }
}







@end
