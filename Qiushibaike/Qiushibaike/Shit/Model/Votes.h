//
//  Votes.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "BaseModel.h"

@interface Votes : BaseModel

@property (nonatomic,strong) NSNumber *down;
@property (nonatomic,strong) NSNumber *up;
@property (nonatomic,strong) NSNumber *created_at;

@end
