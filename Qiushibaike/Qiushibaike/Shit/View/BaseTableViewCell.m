//
//  BaseTableViewCell.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

#pragma mark - 给单元格赋值
- (void)configureCellWithModel:(BaseModel *)model{

}

#pragma mark - 初始化,把控件添加到单元格上
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.disImageView];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.userAcatar];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.bottomView];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.RightMarkView];
        [self.contentView addSubview:self.pic];
        [self.contentView addSubview:self.pic2];
        [self.contentView addSubview:self.pic3];
        
    }
    return self;
}

#pragma mark - 用户头像
-(UIImageView *)userAcatar{
    if (!_userAcatar) {
        _userAcatar = [[UIImageView alloc]init];
    }
    return _userAcatar;
}

#pragma mark - 用户名
- (UILabel *)userName{
    if (!_userName) {
        _userName = [[UILabel alloc]init];
    }
    return _userName;
}


#pragma mark - 图片
- (UIImageView *)disImageView{
    if (!_disImageView) {
        _disImageView = [[UIImageView alloc]init];
        _disImageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _disImageView;
}

#pragma mark - 文本内容
- (UILabel *)content{
    if (!_content) {
        _content = [[UILabel alloc]init];
         [self.contentView addSubview:self.content];
    }
    return _content;
}

#pragma mark - 底部视图
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
    }
    return _bottomView;
}

#pragma mark - 评论
- (UILabel *)comment{
    if (!_comment) {
        _comment = [[UILabel alloc]init];
        [self.bottomView addSubview:self.comment];
    }
    return _comment;
}

#pragma mark - 好笑
- (UILabel *)up{
    if (!_up) {
        _up = [[UILabel alloc]init];
        [self.bottomView addSubview:self.up];
    }
    return _up;
}

#pragma mark - 无聊
- (UILabel *)down{
    if (!_down) {
        _down = [[UILabel alloc]init];
        [self.bottomView addSubview:self.down];
    }
    return _down;
}

#pragma mark - 好笑,无聊,评论对应的button
- (UIButton *)upButton{
    if (!_upButton) {
        _upButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomView addSubview:self.upButton];
    }
    return _upButton;
}

- (UIButton *)downButton{
    if (!_downButton) {
        _downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomView addSubview:self.downButton];
    }
    return _downButton;
}

- (UIButton *)commentButton{
    if (!_commentButton) {
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomView addSubview:self.commentButton];
    }
    return _commentButton;
}

#pragma mark - 发布时间
- (UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
    }
    return _time;
}

#pragma mark - 右边标签视图
- (UIView *)RightMarkView{
    if(!_RightMarkView){
        _RightMarkView = [[UIView alloc]init];
    }
    return _RightMarkView;
}

#pragma mark - 右部图片
- (UIView *)markImage{
    if (!_markImage) {
        _markImage = [[UIImageView alloc]init];
        [self.RightMarkView addSubview:self.markImage];
    }
    return _markImage;
}

#pragma mark - 右部标签类型
- (UIView *)markType{
    if (!_markType) {
        _markType = [[UILabel alloc]init];
        [self.RightMarkView addSubview:self.markType];
    }
    return _markType;
}

#pragma mark - 视频截图
- (UIImageView *)pic{
    if (!_pic) {
        _pic = [[UIImageView alloc]init];
    }
    return _pic;
}


- (UIImageView *)pic2{
    if (!_pic2) {
        _pic2 = [[UIImageView alloc]init];
    }
    return _pic2;
}

- (UIImageView *)pic3{
    if (!_pic3) {
        _pic3 = [[UIImageView alloc]init];
    }
    return _pic3;
}

#pragma mark - 播放图片
- (UIButton *)playButton{
    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.pic addSubview:self.playButton];
    }
    return _playButton;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
