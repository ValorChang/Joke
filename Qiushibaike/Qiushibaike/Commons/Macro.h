//
//  Macro.h
//  Qiushibaike
//
//  Created by 常迪 on 15/11/12.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#ifndef Qiushibaike_Macro_h
#define Qiushibaike_Macro_h



#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)      // 屏幕宽度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)    // 屏幕高度

// 通过Red, Green, Blue设置颜色值
#define UIColorWithRGBA(r,g,b,a)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f  alpha:(a)]
#define UIColorWithRGB(r,g,b)       UIColorWithRGBA(r, g, b,                                           1.0)

// 通过16进制数设置颜色值
#define UIColorWithHexA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0                                                        \
blue:((float)(rgbValue & 0xFF))/255.0                                                                  \
alpha:(a)]


#define KLeftSpacing   10 //距离左边的距离
#define KMidSPacing    5  //中间的距离
#define KRightSpacing  10 //距离右边的距离
#define KTopSpacing    5  //距离顶部的距离

#define video_pic_size 480//视频缩略图的尺寸


#pragma mark - Log

#ifdef DEBUG
#   define DLog(...) NSLog((@"%s [Line %d] %@"), __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#   define SLog(...) NSLog(__VA_ARGS__)
#else
#   define DLog(...)
#   define SLog(...)
#endif

#pragma mark - String

#define HSStringFromCGSize(size) [NSString stringWithFormat:@"%.0f_%.0f", size.width * SCREEN_SCALE, size.height * SCREEN_SCALE]


#endif
