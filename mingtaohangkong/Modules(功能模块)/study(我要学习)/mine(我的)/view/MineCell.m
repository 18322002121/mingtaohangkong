//
//  MineCell.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MineCell.h"
#import "ModuleSelectionModel.h"
@interface MineCell ()
@property(nonatomic,strong)UIImageView *iconImages;
@property(nonatomic,strong)PublicLabel *titles;
@property(nonatomic,strong)UIImageView *arrows;

@end
@implementation MineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        _iconImages = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconImages];
        
        _titles = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_titles];
        
        _arrows = [[UIImageView alloc]init];
        _arrows.image = [UIImage imageNamed:@"unexpanded"];
        [self addSubview:_arrows];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_iconImages mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(27);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImages.mas_right).offset(10);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
    }];
    
    [_arrows mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(7, 12));
    }];
}

- (void)setSelectionModel:(ModuleSelectionModel *)selectionModel{
    _selectionModel = selectionModel;
    _iconImages.image = [UIImage imageNamed:selectionModel.iconImage];
    _titles.text = selectionModel.gridTitle;
}

@end
