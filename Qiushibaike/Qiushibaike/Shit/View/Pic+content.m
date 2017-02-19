//
//  Pic+content.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "Pic+content.h"

@implementation Pic_content

- (void)awakeFromNib{
   
}

//重写父类的设置单元格的方法
- (void)configureCellWithModel:(ExclusiveModel *)model{
    self.content.text = model.content;
    self.content.numberOfLines = 0;
    self.content.font = [UIFont systemFontOfSize:17];
    self.content.frame  =CGRectMake(KLeftSpacing, 60+15, SCREEN_WIDTH-2*KLeftSpacing, 40);
    CGRect contentFrame = self.content.frame;
    contentFrame.size.height = model.contentHeight;
    self.content.frame = contentFrame;
    
#pragma mark - 设置图片
    
    NSString *picURLString = [NSString stringWithFormat:kPicURLFormat,[[model.identify stringValue] substringToIndex:[model.identify stringValue].length-4],[model.identify stringValue],model.image];
        [self.disImageView sd_setImageWithURL:[NSURL URLWithString:picURLString]];
        self.disImageView.frame = CGRectMake(KLeftSpacing,0, SCREEN_WIDTH-2*KLeftSpacing, 0);
        CGFloat imageHeight = 359 * model.imageHeight / (model.imageaWidth+0.00000001);
        //获取图片原始尺寸
        CGRect imageFrame = self.disImageView.frame;
        //设置图片y轴,高度
        imageFrame.origin.y = contentFrame.origin.y + CGRectGetHeight(contentFrame)+5;
        imageFrame.size.height = imageHeight;
        //重新赋值给imageView
        self.disImageView.frame = imageFrame;
#pragma mark - 用户头像,用户名赋值
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
    self.userAcatar.frame = CGRectMake(KLeftSpacing, KTopSpacing, 50,50);
    self.userName.frame = CGRectMake(3*KMidSPacing + 50, 10 + KTopSpacing, SCREEN_WIDTH - (3 * KMidSPacing + 50), 30);
    self.userName.numberOfLines =0;
    self.userName.font = [UIFont systemFontOfSize:15];
    self.userAcatar.layer.cornerRadius = 25;
    self.userAcatar.layer.masksToBounds = YES;
    self.userAcatar.layer.borderWidth= 0.01;
    
    
#pragma mark - 设置发布时间
    NSDate *publishDate = [NSDate dateWithTimeIntervalSince1970:model.published_at.doubleValue];    //将时间戳转换成日期对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //日期格式化
    
    //设置日期格式字符串
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeString = [formatter stringFromDate:publishDate];
    
    self.time.text  = [NSString stringWithFormat:@"发布时间:%@",timeString];
    self.time.frame = CGRectMake(3 *KMidSPacing + 50 , 30 + 5, 105, 30);
    self.time.font = [UIFont systemFontOfSize:10];

    

#pragma mark - 设置底部视图上的label
    self.up.text = [NSString stringWithFormat:@"%@",[model.votes.up stringValue]];
    self.up.frame = CGRectMake(25, 16, 50, 15);
    self.up.font = [UIFont systemFontOfSize:15];
        self.comment.textAlignment = NSTextAlignmentLeft;
    self.up.textColor = [UIColor lightGrayColor];
    
    //无聊是NSNumber类型 前面还有一个负号, 这个两步是转成string字符串,再截除负号
    NSString *str = [model.votes.down stringValue];
    NSString *str2 = [str substringFromIndex:1];
    
    self.down.text = [NSString stringWithFormat:@"%@",str2];
    self.down.frame = CGRectMake(115, 16, 50, 15);
    self.down.font = [UIFont systemFontOfSize:15];
        self.comment.textAlignment = NSTextAlignmentLeft;
    self.down.textColor = [UIColor lightGrayColor];
    
    self.comment.text = [NSString stringWithFormat:@"%@",[model.comments_count stringValue]];
    self.comment.textAlignment = NSTextAlignmentLeft;
    self.comment.frame = CGRectMake(SCREEN_WIDTH - 68, 15, 50, 15);
    self.comment.font = [UIFont systemFontOfSize:15];
    self.comment.textAlignment = NSTextAlignmentLeft;
    self.comment.textColor = [UIColor lightGrayColor];
    
    
#pragma mark - 设置底部视图上的button
    [self.upButton setBackgroundImage:[UIImage imageNamed:@"icon_for"] forState:UIControlStateNormal];
    [self.upButton setBackgroundImage:[UIImage imageNamed:@"icon_for_active"] forState:UIControlStateHighlighted];
    self.upButton.frame = CGRectMake(-30, 0, 79, 49);
    [self.downButton setBackgroundImage:[UIImage imageNamed:@"icon_against"] forState:UIControlStateNormal];
    self.downButton.frame = CGRectMake(70, 0, 64.5, 49);
    [self.commentButton setBackgroundImage:[UIImage imageNamed:@"button_comment"] forState:UIControlStateNormal];
    self.commentButton.frame = CGRectMake(SCREEN_WIDTH - 120, 0, 75.5, 49);
    

    
#pragma mark - 设置视频图片截图
    [self.pic sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    //获取图片原始尺寸
    self.pic.frame = CGRectZero;
    if ([model.format isEqualToString:@"video"]) {
        self.pic.frame = CGRectMake(KLeftSpacing, 0, SCREEN_WIDTH-2*KLeftSpacing, SCREEN_WIDTH-2*KLeftSpacing);
    }
    CGRect picFrame = self.pic.frame;
    //设置图片y轴,高度
    picFrame.origin.y = contentFrame.origin.y + CGRectGetHeight(contentFrame)+5;
    //重新赋值给imageView
    self.pic.frame = picFrame;
    self.pic.userInteractionEnabled = YES;



#pragma mark - 播放的button
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"iconfont-play-4"] forState:UIControlStateNormal];
    self.playButton.frame = CGRectMake((self.superview.frame.size.width-2*KLeftSpacing)/2-40, (self.superview.frame.size.width-2*KLeftSpacing)/2-40, 80, 80);
    self.alpha = 0.9;


#pragma mark - 判断播放图片是否显示
   
    if ([model.format isEqualToString:@"video"]) {
        self.playButton.hidden = NO;
    }
    else {
        self.playButton.hidden = YES;
    }
#pragma mark - 设置底部视图
    self.bottomView.frame = CGRectMake(KLeftSpacing, 0, SCREEN_WIDTH - 2*KLeftSpacing, 60);

    CGRect bottomFrame = self.bottomView.frame;
    bottomFrame.origin.y = imageFrame.origin.y + imageHeight+5;
    self.bottomView.frame = bottomFrame;
    
    if ([model.format isEqualToString:@"video"]) {
        CGRect bottomFrame = self.bottomView.frame;
        bottomFrame.origin.y = picFrame.origin.y +picFrame.size.height +5;
        self.bottomView.frame = bottomFrame;
    }
    if ([model.format isEqualToString:@"word"]) {
        CGRect bottomFrame = self.bottomView.frame;
        bottomFrame.origin.y = contentFrame.origin.y +CGRectGetHeight(contentFrame)+5;
        self.bottomView.frame = bottomFrame;
    }
    

#pragma mark - 设置右边的标签
    self.RightMarkView.frame = CGRectMake(SCREEN_WIDTH - 70, KTopSpacing, 70, 64);
    self.markType.frame = CGRectMake(20, 0, 20,20);
    self.markImage.frame = CGRectMake(0, 0, 20 ,20);
    self.markType.font = [UIFont systemFontOfSize:10];
    if ([model.type isEqualToString:@"fresh"]) {
     
        self.markImage.image = [UIImage imageNamed:@"iconfont-yezi"];
        self.markType.text = [NSString stringWithFormat:@"新鲜"];

    }
    else if([model.type isEqualToString:@"hot"]){

        self.markImage.image = [UIImage imageNamed:@"iconfont-fire-2"];
        self.markType.text = [NSString stringWithFormat:@"热门"];

    }

    else if([model.type isEqualToString:@"promote"]){
        
        //没有标题,隐藏标题类型 和 图片
        self.markImage.hidden = YES ;
        self.markType.hidden  = YES;

    }
    


}

@end
