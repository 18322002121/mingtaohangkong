//
//  ClassificationSelectionCell.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "ClassificationSelectionCell.h"
#import "ModuleSelectionModel.h"

@interface ClassificationSelectionCell ()
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) UILabel *iconTitle;
@end

@implementation ClassificationSelectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadingViews];
    }
    return self;
}

#pragma mark - 加载视图

- (void)loadingViews{
    _iconImage = [[UIImageView alloc]init];
//    _iconImage.backgroundColor = kRandomColor;
    _iconImage.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_iconImage];
    
    _iconTitle = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_iconTitle];
}

#pragma mark - 添加约束

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(30);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    
    [_iconTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImage.mas_bottom).offset(14);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
    }];
}

- (void)setSelectionModel:(ModuleSelectionModel *)selectionModel{
    _selectionModel = selectionModel;
    _iconImage.image = [UIImage imageNamed:selectionModel.iconImage];
    _iconTitle.text = selectionModel.gridTitle;
}





@end
