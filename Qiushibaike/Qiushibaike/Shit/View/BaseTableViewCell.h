//
//  BaseTableViewCell.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *disImageView;
@property (nonatomic,strong)UILabel *content;
@property (nonatomic,strong)UIImageView *userAcatar;   //用户头像
@property (nonatomic,strong)UILabel *userName; //用户名
@property (nonatomic,strong)UIView *bottomView; //底部视图
@property (nonatomic,strong)UILabel *up;
@property (nonatomic,strong)UILabel *down;
@property (nonatomic,strong)UILabel *comment;
@property (nonatomic,strong)UIButton *upButton;
@property (nonatomic,strong)UIButton *downButton;
@property (nonatomic,strong)UIButton *commentButton;
@property (nonatomic,strong)UILabel *time;  //发布时间
@property (nonatomic,strong)UIView *RightMarkView;  //右部标签视图
@property (nonatomic,strong)UIImageView *markImage;  //标签图片样式
@property (nonatomic,strong)UILabel *markType ;  //标签样式
@property (nonatomic,strong)UIImageView *pic;   //视频截图
@property (nonatomic,strong)UIImageView *pic2;
@property (nonatomic,strong)UIImageView *pic3;
@property (nonatomic,strong)UIButton *playButton; //播放



- (void)configureCellWithModel:(BaseModel *)model;
@end
