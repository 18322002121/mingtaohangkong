//
//  CourseChaptersHeaderView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseChaptersHeaderView.h"
@interface CourseChaptersHeaderView ()
@property (nonatomic,strong) PublicLabel *titles;
@property (nonatomic,strong) UIImageView *rightIcon;
@end
@implementation CourseChaptersHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        _titles = [PublicLabel labelWithText:@"一、 礼仪意识的养成" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_titles];
        
        _rightIcon = [[UIImageView alloc]init];
        _rightIcon.image = [UIImage imageNamed:@"unexpanded"];
        [self.contentView addSubview:_rightIcon];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(21);
    }];
    
    [_rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-23);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(7, 12));
    }];
}

@end
