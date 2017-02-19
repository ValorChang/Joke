//
//  CommentsViewController.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/18.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "BaseTableViewController.h"
#import "ExclusiveModel.h"
@interface CommentsViewController : BaseTableViewController

@property (nonatomic,strong)NSString *identity;

@property (nonatomic,strong)ExclusiveModel *model;

@property (nonatomic,strong)NSMutableArray *datasArr;

@end
