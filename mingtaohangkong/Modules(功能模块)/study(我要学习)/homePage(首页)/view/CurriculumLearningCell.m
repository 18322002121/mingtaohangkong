//
//  CurriculumLearningCell.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/29.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CurriculumLearningCell.h"
@interface CurriculumLearningCell ()
@property(nonatomic,strong)UIImageView *showImages;
@end
@implementation CurriculumLearningCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _showImages = [[UIImageView alloc]init];
        _showImages.backgroundColor = kRandomColor;
        [self.contentView addSubview:_showImages];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_showImages mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(38);
        make.right.mas_equalTo(self.mas_right).offset(-38);
        make.top.mas_equalTo(self.mas_top).offset(12);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-12);
    }];
}

@end
