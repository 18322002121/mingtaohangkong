//
//  CourseChaptersCell.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseChaptersCell.h"
#import "CourseChaptersModel.h"
@interface CourseChaptersCell ()
@property (nonatomic,strong) PublicLabel *titles;
@end
@implementation CourseChaptersCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titles = [PublicLabel labelWithText:@"01.  中国礼仪的起源与发展" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_titles];

    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.contentView.mas_left).offset(37);
    }];
}

//- (void)setCourseChaptersModel:(CourseChaptersModel *)courseChaptersModel{
//    _courseChaptersModel = courseChaptersModel;
//    _titles.text = courseChaptersModel.className;
//
//}
- (void)setStudentsModel:(Students *)studentsModel{
    _studentsModel = studentsModel;
    _titles.text = studentsModel.name;
}


@end
