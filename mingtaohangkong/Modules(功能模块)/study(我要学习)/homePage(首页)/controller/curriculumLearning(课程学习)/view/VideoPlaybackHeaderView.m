//
//  VideoPlaybackHeaderView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "VideoPlaybackHeaderView.h"
@interface VideoPlaybackHeaderView ()
@property(nonatomic,strong)UIView *view;
@end
@implementation VideoPlaybackHeaderView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _view = [[UIView alloc]init];
        _view.backgroundColor = [UIColor redColor];
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
