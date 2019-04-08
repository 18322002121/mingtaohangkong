//
//  NormalHeaderView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "NormalHeaderView.h"
@interface NormalHeaderView ()
@property(nonatomic,copy)UIView *bgViews;
@property(nonatomic,copy)PublicLabel *titles;

@end
@implementation NormalHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _bgViews = [[UIView alloc]init];
        _bgViews.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        [self addSubview:_bgViews];
    
        _titles = [PublicLabel labelWithText:@"免费课程" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [_bgViews addSubview:_titles];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bgViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(25);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-25);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(21);
    }];

}

@end
