//
//  ExclusiveModel.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "ExclusiveModel.h"

@implementation ExclusiveModel

- (instancetype)init{
    if (self = [super init]) {
        self.user = [[UserModel alloc]init];
        self.votes = [[Votes alloc]init];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"image_size"]) {
        NSArray *imageSize = [value objectForKey:@"m"];
        self.imageaWidth = [imageSize[0]doubleValue];   // NSNumber 转成 double
        self.imageHeight = [imageSize[1]doubleValue];
    }

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"identify"];
    }

}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"user"]) {
        [self.user setValuesForKeysWithDictionary:value];
    }
    else if([key isEqualToString:@"votes"]){
        [self.votes setValuesForKeysWithDictionary:value];
    }
    else {
        [super setValue:value forKey:key];
    }

}





@end
