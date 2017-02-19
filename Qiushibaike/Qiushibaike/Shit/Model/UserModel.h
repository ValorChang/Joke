//
//  UserModel.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel

@property (nonatomic,strong) NSNumber *avatar_updated_at;
@property (nonatomic,strong) NSNumber *last_visited_at;
@property (nonatomic,strong) NSNumber *created_at;
@property (nonatomic,strong) NSString *state;   //状态
@property (nonatomic,strong) NSString *email;   //用户邮箱;
@property (nonatomic,strong) NSString *last_device;
@property (nonatomic,strong) NSString *role;
@property (nonatomic,strong) NSString *login;   //用户名(昵称)
@property (nonatomic,strong) NSNumber *identify;    //用户ID
@property (nonatomic,strong) NSString *icon;    //用户头像名,用于拼接用户头像
@property (nonatomic,strong) NSString *gender;  //性别
@property (nonatomic,strong) NSNumber *age; //年龄
@end
