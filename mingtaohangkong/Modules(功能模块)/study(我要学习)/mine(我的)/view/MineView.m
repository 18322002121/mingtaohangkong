//
//  MineView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MineView.h"
@interface MineView ()
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)PublicLabel *titles;
@property(nonatomic,strong)PublicButton *setting;
@property(nonatomic,strong)UIView *showView;
@property(nonatomic,strong)UIImageView *iconImage;
@end
@implementation MineView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor colorWithHexString:@"#AF1D36"];
        [self addSubview:_bgView];
        
        _titles = [PublicLabel labelWithText:@"我的" textColor:[UIColor colorWithHexString:@"#FFFFFF"] font:[UIFont systemFontOfSize:18] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [_bgView addSubview:_titles];
        
        _setting = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"" titleColor:[UIColor clearColor] textFont:[UIFont systemFontOfSize:12] backgroundColor:[UIColor greenColor] addView:_bgView target:self action:@selector(settingClick:)];
        
        _showView = [[UIView alloc]init];
        _showView.layer.cornerRadius =5;
        _showView.layer.shadowColor = [UIColor colorWithHexString:@"#B6B6B6"].CGColor;
        _showView.layer.shadowOpacity = 0.6f;
        _showView.layer.shadowOffset = CGSizeMake(0,6);
        _showView.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
        [self addSubview:_showView];
        
        _iconImage = [[UIImageView alloc]init];
        _iconImage.layer.cornerRadius = 35;
        _iconImage.backgroundColor = kRandomColor;
        [_showView addSubview:_iconImage];

    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.height.mas_offset(@138);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView.mas_top).offset(16);
        make.centerX.mas_equalTo(self.bgView.mas_centerX).offset(0);
    }];
    
    [_setting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView.mas_top).offset(16);
        make.right.mas_equalTo(self.bgView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(21, 21));
    }];
    
    [_showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(24);
        make.right.mas_equalTo(self.mas_right).offset(-24);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
        make.height.mas_offset(@125);
    }];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.showView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.showView.mas_left).offset(22);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
}

- (void)settingClick:(UIButton *)sender{
    !_settingBlock ? : _settingBlock(sender);
}



@end
