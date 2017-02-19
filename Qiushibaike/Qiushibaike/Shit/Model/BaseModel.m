//
//  BaseModel.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}


- (void)setNilValueForKey:(NSString *)key{

}

#pragma mark - 自适应文本高度
- (CGFloat)contentHeight{
    CGRect rect=[self.content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-2*KLeftSpacing, 10000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    return CGRectGetHeight(rect);
}



@end
