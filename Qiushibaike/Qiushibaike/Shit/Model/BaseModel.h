//
//  BaseModel.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic,strong) NSString *content; //专享的文本内容

- (CGFloat)contentHeight;

@end
