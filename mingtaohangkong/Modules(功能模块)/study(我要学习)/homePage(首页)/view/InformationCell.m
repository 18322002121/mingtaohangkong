//
//  InformationCell.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/29.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "InformationCell.h"
@interface InformationCell ()
@property (nonatomic,strong) PublicLabel *titles;
@property (nonatomic,strong) PublicLabel *detailTitles;
@property (nonatomic,strong) UIImageView *showImage;
@end
@implementation InformationCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _titles = [PublicLabel labelWithText:@"我也不知道说点什么：" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_titles];
        
        _detailTitles = [PublicLabel labelWithText:@"那就随便说点什么吧，这个原型画的太好看了，哈哈哈。" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentLeft backgroundColor:[UIColor clearColor]];
        _detailTitles.lineBreakMode = NSLineBreakByWordWrapping;
        _detailTitles.numberOfLines = 0;
        [self.contentView addSubview:_detailTitles];
        
        _showImage = [[UIImageView alloc]init];
        _showImage.layer.cornerRadius = 5;
        _showImage.backgroundColor = kRandomColor;
        [self.contentView addSubview:_showImage];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(18);
        make.top.mas_equalTo(self.contentView.mas_top).offset(19);
    }];
    
    [_detailTitles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(18);
        make.top.mas_equalTo(self.titles.mas_bottom).offset(16);
        make.right.mas_equalTo(self.showImage.mas_left).offset(-5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-13);
        make.size.mas_equalTo(CGSizeMake(100, 80));
    }];
}



@end
