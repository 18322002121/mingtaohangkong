//
//  CourseCenterCell.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseCenterCell.h"

@interface CourseCenterCell ()
@property(nonatomic,strong)UIView *bgView;//背景视图
@property(nonatomic,strong)UIImageView *showImage;//展示图片
@property(nonatomic,strong)PublicLabel *titles;//展示标题
@property(nonatomic,strong)UIImageView *iconNames;//头像图片
@property(nonatomic,strong)PublicLabel *names;//头像标题
@property(nonatomic,strong)PublicLabel *playNumbers;//播放次数
@end


@implementation CourseCenterCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadingViews];
    }
    return self;
}

- (void)loadingViews{
    _bgView = [[UIView alloc]init];
    _bgView.layer.cornerRadius = 10;
    _bgView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _bgView.layer.shadowColor = [UIColor colorWithHexString:@"#B6B6B6"].CGColor;
    _bgView.layer.shadowOpacity = 0.8f;
    _bgView.layer.shadowOffset = CGSizeMake(0,8);
    [self.contentView addSubview:_bgView];

    _showImage = [[UIImageView alloc]init];
    _showImage.backgroundColor = kRandomColor;
    _showImage.layer.cornerRadius = 10;
    [self.bgView addSubview:_showImage];
    
    _titles = [PublicLabel labelWithText:@"空乘职业形象：空乘礼仪课程" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.bgView addSubview:_titles];

    _iconNames = [[UIImageView alloc]init];
    _iconNames.backgroundColor = kRandomColor;
    [self.bgView addSubview:_iconNames];
    
    _names = [PublicLabel labelWithText:@"张妮妮" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.bgView addSubview:_names];
    
    _playNumbers = [PublicLabel labelWithText:@"14.2万次 播放" textColor:[UIColor colorWithHexString:@"#999999"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.bgView addSubview:_playNumbers];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(13);
        make.right.mas_equalTo(self.mas_right).offset(-13);
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
    }];
    
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView.mas_top).offset(0);
        make.left.mas_equalTo(self.bgView.mas_left).offset(0);
        make.right.mas_equalTo(self.bgView.mas_right).offset(0);
        make.height.mas_offset(@179);
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showImage.mas_bottom).offset(15);
        make.left.mas_equalTo(self.bgView.mas_left).offset(17);
    }];

    [_iconNames mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titles.mas_bottom).offset(13);
        make.left.mas_equalTo(self.bgView.mas_left).offset(16);
        make.size.mas_equalTo(CGSizeMake(29, 29));
    }];
    
    [_names mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconNames.mas_right).offset(8);
        make.centerY.mas_equalTo(self.iconNames.mas_centerY).offset(0);
    }];
    
    [_playNumbers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bgView.mas_right).offset(-19);
        make.centerY.mas_equalTo(self.names.mas_centerY).offset(0);
    }];
    
}


@end
