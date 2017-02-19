//
//  FriendsCell.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/21.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "FriendsCell.h"

@implementation FriendsCell






- (void)configureCellWithModel:(FriendsModel *)model{
#pragma mark -用户头像,用户名赋值
    if (model.user.identify) {
        self.userName.text = model.user.login;
        self.userName.textColor = [UIColor orangeColor];
        NSString *picURLString = [NSString stringWithFormat:kAvatarURLFormat, [model.user.identify.stringValue substringToIndex:model.user.identify.stringValue.length - 4], model.user.identify, model.user.icon];
        [self.userAcatar sd_setImageWithURL:[NSURL URLWithString:picURLString] placeholderImage:[UIImage imageNamed:@"default_avatar"]];
    }else{
        self.userName.text = @"匿名用户";
        self.userName.textColor = [UIColor blackColor];
        self.userAcatar.image = [UIImage imageNamed:@"user_icon_anonymous"];
    }
    
    self.userAcatar.frame = CGRectMake(KLeftSpacing, KTopSpacing, 40,40);
    self.userName.frame = CGRectMake(3*KMidSPacing + 40, 2 * KTopSpacing, SCREEN_WIDTH - (3 * KMidSPacing + 30), 30);
    self.userName.numberOfLines =0;
    self.userName.font = [UIFont systemFontOfSize:15];
    self.userAcatar.layer.cornerRadius = 20;
    self.userAcatar.layer.masksToBounds = YES;
    self.userAcatar.layer.borderWidth= 0.01;
    
    if([model.content rangeOfString:@"circle_content"].location != NSNotFound)
    {
        model.content = nil;
    }

    self.content.text = model.content;
    self.content.numberOfLines = 0;
    self.content.font = [UIFont systemFontOfSize:17];
    self.content.frame  =CGRectMake(KLeftSpacing, 60, SCREEN_WIDTH-2*KLeftSpacing, 40);
    CGRect contentFrame = self.content.frame;
    contentFrame.size.height = model.contentHeight;
    self.content.frame = contentFrame;

#pragma mark -设置图片
    [self.pic sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    if (model.pic_url2) {
         [self.pic2 sd_setImageWithURL:[NSURL URLWithString:model.pic_url2]];
    }
    if (model.pic_url3) {
       [self.pic3 sd_setImageWithURL:[NSURL URLWithString:model.pic_url3]];
    }
    self.pic.frame = CGRectMake(KLeftSpacing, 0, (SCREEN_WIDTH-2*KLeftSpacing)/3, (SCREEN_WIDTH-2*KLeftSpacing)/3);
    //获取图片原始尺寸
    CGRect picFrame = self.pic.frame;
    //设置图片y轴,高度
    picFrame.origin.y = contentFrame.origin.y + CGRectGetHeight(contentFrame)+5;
    //重新赋值给imageView
    self.pic.frame = picFrame;

    
#pragma mark -设置发布时间
    NSDate *publishDate = [NSDate dateWithTimeIntervalSince1970:model.created_at.doubleValue];    //将时间戳转换成日期对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //日期格式化
    
    //设置日期格式字符串
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeString = [formatter stringFromDate:publishDate];
    
    self.time.text  = [NSString stringWithFormat:@"发布时间:%@",timeString];
    self.time.frame = CGRectMake(3 *KMidSPacing + 45 ,30, 110, 30);
    self.time.font = [UIFont systemFontOfSize:10];

}


@end
