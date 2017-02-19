//
//  FriendsModel.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/21.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "BaseModel.h"

@interface FriendsModel : BaseModel

@property (nonatomic,strong) NSNumber  *created_at;//发布时间
@property (nonatomic,strong) NSString  *tag;
@property (nonatomic,strong) UserModel *user;
@property (nonatomic,copy  ) NSNumber  *identify;//图片ID
@property (nonatomic,strong) NSString  *pic_urls;
@property (nonatomic,strong) NSString  *pic_url;
@property (nonatomic,strong) NSString  *pic_url2;
@property (nonatomic,strong) NSString  *pic_url3;
@property (nonatomic,strong) NSString  *content;//内容
@property (nonatomic,strong) NSString  *state;//状态
@property (nonatomic,strong) NSNumber  *comments_count;//评论数
@property (nonatomic,strong) NSString  *distance;//地点
@property (nonatomic,strong) NSNumber  *like_count;//点赞数


@end
