//
//  CourseRecommendationCell.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseRecommendationCell.h"
@interface CourseRecommendationCell ()
@property(nonatomic,strong)UIImageView *showImage;
@property(nonatomic,strong)PublicLabel *titles;
@property(nonatomic,strong)PublicLabel *playbackVolume;
@property(nonatomic,strong)PublicLabel *price;
@property(nonatomic,strong)PublicLabel *courseNumber;
@property(nonatomic,strong)PublicButton *learningAtOnce;

@end
@implementation CourseRecommendationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _showImage = [[UIImageView alloc]init];
        _showImage.backgroundColor = kRandomColor;
        [self.contentView addSubview:_showImage];
        
        _titles = [PublicLabel labelWithText:@"空乘礼仪形象：空乘礼仪课程" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_titles];
        
        _playbackVolume = [PublicLabel labelWithText:@"14.2万次 播放" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_playbackVolume];
        
        _price = [PublicLabel labelWithText:@"58币" textColor:[UIColor colorWithHexString:@"#AF1D36"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_price];
        
        _courseNumber = [PublicLabel labelWithText:@"共4节" textColor:[UIColor colorWithHexString:@"#999999"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_courseNumber];
        
        _learningAtOnce = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"立即学习" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:11] backgroundColor:[UIColor colorWithHexString:@"#AF1D36"] addView:self.contentView target:self action:@selector(learningAtOnceClick)];
        _learningAtOnce.layer.cornerRadius = 10;
        
        
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(13);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(112, 90));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(25);
        make.left.mas_equalTo(self.showImage.mas_right).offset(11);
    }];
    
    [_playbackVolume mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titles.mas_bottom).offset(15);
        make.left.mas_equalTo(self.showImage.mas_right).offset(11);
    }];
    
    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.playbackVolume.mas_bottom).offset(17);
        make.left.mas_equalTo(self.showImage.mas_right).offset(11);
    }];
    
    [_courseNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-17);
        make.centerY.mas_equalTo(self.playbackVolume.mas_centerY).offset(0);
        
    }];
    
    [_learningAtOnce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 21));
        make.centerY.mas_equalTo(self.price.mas_centerY).offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-18);
    }];
    
}

- (void)learningAtOnceClick{
    
}

@end
