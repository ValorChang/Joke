//
//  CommentsModel.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/18.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "BaseModel.h"
#import "UserModel.h"
#import "Votes.h"
@interface CommentsModel : BaseModel

@property (nonatomic,strong) NSNumber  *total;
@property (nonatomic,copy  ) NSString  *content;
@property (nonatomic,strong) NSNumber  *floor;
@property (nonatomic,strong) UserModel *user;
@property (nonatomic,strong) NSNumber  *page;
@property (nonatomic,strong) NSNumber  *err;



- (CGFloat)commentsHeight;

@end

