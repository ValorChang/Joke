//
//  VideoDetailsViewController.m
//  Qiushibaike
//
//  Created by 常迪 on 15/11/17.
//  Copyright (c) 2015年 常迪. All rights reserved.
//

#import "VideoDetailsViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface VideoDetailsViewController ()

@property (strong, nonatomic) MPMoviePlayerController *player;

@end

@implementation VideoDetailsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self playMyVideo];
}

- (void)playMyVideo{
    
    /*
     *本地播放
     *
     self.player = [[MPMoviePlayerController alloc]init];
     
     //路径的设置，这里要注意，不要用[NSURL urlwithstring],还要去确保路径的正确
     NSBundle *bundle = [NSBundle mainBundle];
     NSString *moviePath = [bundle pathForResource:@"111/Viva" ofType:@"mp4"];
     NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
     */
    
    //很重要的一点是在头文件里已经把player变为属性了，@property（nonamaic,strong），如果不写为属性就会黑屏，目前不知道为什么
    
    self.player =[[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:self.video_url]];
    _player.controlStyle=MPMovieControlStyleDefault;
    [_player prepareToPlay];
    [_player.view setFrame:self.view.bounds];  // player的尺寸
    
    _player.shouldAutoplay=YES;
    [self.view addSubview: _player.view];
    
}





-(void)exitFullScreen:(NSNotification *)notification{
    [_player.view removeFromSuperview];
    NSLog(@"remove player");
}

@end
