//
//  CommentsViewCell.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/18.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "CommentsViewCell.h"

@implementation CommentsViewCell

- (UILabel *)floor{
    if (!_floor) {
        _floor =[[UILabel alloc]init];
        [self.contentView addSubview:_floor];
    }
    return _floor;
}


- (void)configureCellWithModel:(CommentsModel *)model{
#pragma mark -用户头像,用户名赋值
    if (model.user.identify) {
        self.userName.text      = model.user.login;
        self.userName.textColor = [UIColor orangeColor];
        NSString *picURLString  = [NSString stringWithFormat:kAvatarURLFormat, [model.user.identify.stringValue substringToIndex:model.user.identify.stringValue.length - 4], model.user.identify, model.user.icon];
         [self.userAcatar sd_setImageWithURL:[NSURL URLWithString:picURLString] placeholderImage:[UIImage imageNamed:@"default_avatar"]];
    }else{
        self.userName.text      = @"匿名用户";
        self.userName.textColor = [UIColor blackColor];
        self.userAcatar.image   = [UIImage imageNamed:@"user_icon_anonymous"];
 }
    
    self.userAcatar.frame = CGRectMake(KLeftSpacing, KTopSpacing, 40,40);
    self.userName.frame = CGRectMake(3*KMidSPacing + 40, 2 * KTopSpacing, SCREEN_WIDTH - (3 * KMidSPacing + 30), 30);
    self.userName.numberOfLines =0;
    self.userName.font = [UIFont systemFontOfSize:15];
    self.userAcatar.layer.cornerRadius = 20;
    self.userAcatar.layer.masksToBounds = YES;
    self.userAcatar.layer.borderWidth= 0.01;
    
    self.content.text = [NSString stringWithFormat:@"%@",model.content];
    self.content.numberOfLines = 0;
    self.content.frame  = CGRectMake(3*KMidSPacing + 40, 0, SCREEN_WIDTH-3*KMidSPacing-40-KRightSpacing, 10);
    self.content.font = [UIFont systemFontOfSize:13];
    CGRect contentFrame = self.content.frame;
    contentFrame.size.height = model.commentsHeight;
    contentFrame.origin.y = self.userAcatar.frame.size.height + 10;
    self.content.frame = contentFrame;
    
    self.floor.text  = [NSString stringWithFormat:@"%@  #",model.floor];
    self.floor.frame = CGRectMake(SCREEN_WIDTH - 30, KTopSpacing, 30, 20);
    self.floor.font  = [UIFont systemFontOfSize:10];
}


@end
