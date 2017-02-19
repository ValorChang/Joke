//
//  SetTableViewCell.m
//  汽车之家框架Demo
//
//  Created by xalo on 15/10/21.
//  Copyright (c) 2015年 itzyd. All rights reserved.
//

#import "SetTableViewCell.h"






@implementation SetTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
    }
    return self;
}

-(UIImageView *)setImage{
    if (!_setImage) {
        _setImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 32, 32)];
        
        [self.contentView addSubview:_setImage];
    }
    return _setImage;
}

-(UILabel *)LabelTitel{
    if (!_LabelTitel) {
        _LabelTitel = [[UILabel alloc]initWithFrame:CGRectMake(55, 4, 150, 30)];
        _LabelTitel.font=[UIFont fontWithName:@"STHeitiSC-Light" size:15];
        [self.contentView addSubview:_LabelTitel];
    }
    return _LabelTitel;
}

-(UILabel *)subLabel{
    if (!_subLabel ) {
        _subLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 30, 150, 20)];
        _subLabel.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_subLabel];
        
    }
    return _subLabel;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
