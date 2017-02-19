//
//  ExclusiveModel.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "BaseModel.h"
#import "UserModel.h"
#import "Votes.h"
@interface ExclusiveModel : BaseModel

@property (nonatomic,strong ) NSString  *high_url;//高清视频的url地址
@property (nonatomic,strong ) NSString  *format;//专享糗事的类别 video/image/word 三种
@property (nonatomic,strong ) NSString  *image;
@property (nonatomic,strong ) NSNumber  *published_at;//发布时间
@property (nonatomic,strong ) NSString  *tag;
@property (nonatomic,strong ) UserModel *user;
@property (nonatomic,copy   ) NSNumber  *identify;//图片ID
@property (nonatomic,strong ) Votes     *votes;
@property (nonatomic,strong ) NSString  *pic_url;
@property (nonatomic,strong ) NSString  *content;//内容
@property (nonatomic,strong ) NSString  *state;//状态
@property (nonatomic,strong ) NSNumber  *comments_count;//评论数
@property (nonatomic,strong ) NSString  *low_url;//低清分辨率的url地址
@property (nonatomic,strong ) NSNumber  *loop;
@property (nonatomic,strong ) NSString  *type;//专享文本糗事的状态
@property (nonatomic, assign) CGFloat   imageHeight;//image的宽度
@property (nonatomic, assign) CGFloat   imageaWidth;//image的高度
@property (nonatomic,strong ) NSString  *distance;//地点
@property (nonatomic,strong ) NSNumber  *like_count;//点赞数

@end
