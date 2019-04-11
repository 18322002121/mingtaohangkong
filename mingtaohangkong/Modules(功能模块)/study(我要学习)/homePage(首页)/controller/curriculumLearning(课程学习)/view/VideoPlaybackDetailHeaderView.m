//
//  VideoPlaybackDetailHeaderView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "VideoPlaybackDetailHeaderView.h"
@interface VideoPlaybackDetailHeaderView ()
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) PublicLabel *titles;
@end
@implementation VideoPlaybackDetailHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        [self addSubview:_bgView];
        
        _titles = [PublicLabel labelWithText:@"免费课程" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [_bgView addSubview:_titles];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bgView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.bgView.mas_left).offset(20);
    }];
}

@end
