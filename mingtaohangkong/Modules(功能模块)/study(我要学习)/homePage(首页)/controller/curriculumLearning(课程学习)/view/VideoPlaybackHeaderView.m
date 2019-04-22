//
//  VideoPlaybackHeaderView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "VideoPlaybackHeaderView.h"
@interface VideoPlaybackHeaderView ()<SuperPlayerDelegate>
@property (nonatomic,strong)UIView *view;
@property (strong, nonatomic) SuperPlayerView *playerView;
@end

@implementation VideoPlaybackHeaderView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _view = [[UIView alloc]init];
        _view.backgroundColor = kRandomColor;
        
        _playerView = [[SuperPlayerView alloc] init];
        // 设置代理，用于接受事件
        _playerView.delegate = self;
        // 设置父View，_playerView会被自动添加到holderView下面
        _playerView.fatherView = self.view;
        SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
        // 设置播放地址，直播、点播都可以
        playerModel.videoURL = @"http://video.url.mingtaokeji.com/admin/video/school/1/1.1%E6%B7%98%E5%AE%9D%E5%B9%B3%E5%8F%B0%E5%8F%91%E5%B1%95%E5%8E%86%E5%8F%B2%E4%B8%8E%E7%8E%B0%E7%8A%B6.mp4";
        // 开始播放
        [_playerView playWithModel:playerModel];
        [self addSubview:_view];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];
    
}

@end
