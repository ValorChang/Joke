//
//  FriendsModel.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/21.
//  Copyright © 2015年 常迪. All rights reserved.
//

#import "FriendsModel.h"
#import "UserModel.h"

@implementation FriendsModel

- (instancetype)init{
    if (self = [super init]) {
        self.user = [[UserModel alloc]init];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"identify"];
    }
    if ([key isEqualToString:@"pic_urls"]) {
//        NSArray *imageSize = [value objectForKey:@"m"];
//        self.imageaWidth = [imageSize[0]doubleValue];   // NSNumber 转成 double
//        self.imageHeight = [imageSize[1]doubleValue];
        NSArray *pic = [value objectForKey:@"pic_urls"];
        for (int i =0; i<pic.count; i++) {
            if (pic.count == 1) {
                self.pic_url = [pic[0] objectForKey:@"pic_url"];
            }
            if (pic.count == 2) {
                self.pic_url2 = [pic[1] objectForKey:@"pic_url"];
            }
            if (pic.count == 3) {
                self.pic_url3 = [pic[2] objectForKey:@"pic_url"];
            }
        }

        }
    }



- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"user"]) {
        [self.user setValuesForKeysWithDictionary:value];
    }
    else {
        [super setValue:value forKey:key];
    }
    
}



@end
