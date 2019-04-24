//
//  VideoPlaybackHeaderView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "VideoPlaybackHeaderView.h"
@interface VideoPlaybackHeaderView ()<SuperPlayerDelegate>
@property (nonatomic,strong)UIView *views;
@property (strong, nonatomic) SuperPlayerView *playerView;
@end

@implementation VideoPlaybackHeaderView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _views = [[UIView alloc]init];
        [self addSubview:_views];
        [self playerViews];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];
    
}

#pragma mark - 创建视频播放器视图

- (void)playerViews{
    _playerView = [[SuperPlayerView alloc] init];
    // 设置代理，用于接受事件
    _playerView.delegate = self;
    // 设置父View，_playerView会被自动添加到holderView下面
    _playerView.fatherView = self.views;
    [self.views addSubview:_playerView];
    SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
    // 设置播放地址，直播、点播都可以
    SuperPlayerUrl *url1 = [SuperPlayerUrl new];
    url1.url = @"http://video.url.mingtaokeji.com/admin/video/school/1/1.1%E6%B7%98%E5%AE%9D%E5%B9%B3%E5%8F%B0%E5%8F%91%E5%B1%95%E5%8E%86%E5%8F%B2%E4%B8%8E%E7%8E%B0%E7%8A%B6.mp4";
    url1.title = @"超清";
    SuperPlayerUrl *url2 = [SuperPlayerUrl new];
    url2.url = @"http://video.url.mingtaokeji.com/admin/video/school/1/1.1%E6%B7%98%E5%AE%9D%E5%B9%B3%E5%8F%B0%E5%8F%91%E5%B1%95%E5%8E%86%E5%8F%B2%E4%B8%8E%E7%8E%B0%E7%8A%B6.mp4";
    url2.title = @"高清";
    SuperPlayerUrl *url3 = [SuperPlayerUrl new];
    url3.url = @"http://video.url.mingtaokeji.com/admin/video/school/1/1.1%E6%B7%98%E5%AE%9D%E5%B9%B3%E5%8F%B0%E5%8F%91%E5%B1%95%E5%8E%86%E5%8F%B2%E4%B8%8E%E7%8E%B0%E7%8A%B6.mp4";
    url3.title = @"标清";
    playerModel.multiVideoURLs = @[url1, url2, url3];
    playerModel.videoURL = url1.url; // 设置默认播放的清晰度
    // 开始播放
    [_playerView playWithModel:playerModel];
}





//- (SuperPlayerView *)playerView {
//    if (!_playerView) {
//        _playerView = [[SuperPlayerView alloc] init];
//        // 设置代理，用于接受事件
//        _playerView.delegate = self;
//        // 设置父View，_playerView会被自动添加到holderView下面
//        _playerView.fatherView = self.views;
//        [self.views addSubview:_playerView];
//        SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
//        // 设置播放地址，直播、点播都可以
//        SuperPlayerUrl *url1 = [SuperPlayerUrl new];
//        url1.url = @"http://5815.liveplay.myqcloud.com/live/5815_62fe94d692ab11e791eae435c87f075e.flv";
//        url1.title = @"超清";
//        SuperPlayerUrl *url2 = [SuperPlayerUrl new];
//        url2.url = @"http://5815.liveplay.myqcloud.com/live/5815_62fe94d692ab11e791eae435c87f075e_900.flv";
//        url2.title = @"高清";
//        SuperPlayerUrl *url3 = [SuperPlayerUrl new];
//        url3.url = @"http://5815.liveplay.myqcloud.com/live/5815_62fe94d692ab11e791eae435c87f075e_550.flv";
//        url3.title = @"标清";
//        playerModel.multiVideoURLs = @[url1, url2, url3];
//        playerModel.videoURL = url1.url; // 设置默认播放的清晰度
//        // 开始播放
//        [_playerView playWithModel:playerModel];
//    }
//    return _playerView;
//}





@end
