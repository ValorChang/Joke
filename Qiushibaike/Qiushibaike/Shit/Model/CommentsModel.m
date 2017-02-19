//
//  CommentsModel.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/18.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "CommentsModel.h"

@implementation CommentsModel

- (instancetype)init{
    if (self  = [super init]) {
    self.user = [[UserModel alloc]init];

    }
    return self;
}


- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"user"]) {
        [self.user setValuesForKeysWithDictionary:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

#pragma mark -自适应评论文本高度
- (CGFloat)commentsHeight{
    CGRect rect=[self.content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-3*KMidSPacing-40-KRightSpacing, 10000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil];
    return CGRectGetHeight(rect);
}

@end
