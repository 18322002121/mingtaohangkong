//
//  SubscribeCell.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "SubscribeCell.h"
@interface SubscribeCell ()
@property(nonatomic,strong)UIView *bgViews;//背景视图
@property(nonatomic,strong)PublicLabel *times;//时间
@property(nonatomic,strong)PublicLabel *lines;//线
@property(nonatomic,strong)UIImageView *iconImages;//头像
@property(nonatomic,strong)PublicLabel *curriculumTitles;//课程标题
@property(nonatomic,strong)PublicLabel *lecturerTitles;//讲师标题
@property(nonatomic,strong)PublicLabel *nodeNumber; //课程节数
@property(nonatomic,strong)PublicLabel *subscribeNumber;//预约人数
@end
@implementation SubscribeCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _bgViews = [[UIView alloc]init];
        _bgViews.layer.cornerRadius = 10;
        _bgViews.layer.borderWidth = 0.5;
        _bgViews.layer.borderColor = [UIColor colorWithHexString:@"#E0E0E0"].CGColor;
        [self.contentView addSubview:_bgViews];
        
        //时间
        _times = [PublicLabel labelWithText:@"15:00" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [_bgViews addSubview:_times];
        
        //线
        _lines = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#E0E0E0"]];
        [_bgViews addSubview:_lines];
        
        //头像
        _iconImages = [[UIImageView alloc]init];
        _iconImages.backgroundColor = [UIColor redColor];
        [_bgViews addSubview:_iconImages];
        
        //课程标题
        _curriculumTitles = [PublicLabel labelWithText:@"【 空乘礼仪课程 】" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [_bgViews addSubview:_curriculumTitles];
        
        //讲师标题
        _lecturerTitles = [PublicLabel labelWithText:@"讲师：名淘资深讲师" textColor:[UIColor colorWithHexString:@"#272727"] font:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [_bgViews addSubview:_lecturerTitles];
        
        //课程节数
        _nodeNumber = [PublicLabel labelWithText:@"共4节" textColor:[UIColor colorWithHexString:@"#999999"] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [_bgViews addSubview:_nodeNumber];
        
        //预约人数
        _subscribeNumber = [PublicLabel labelWithText:@"258人预约" textColor:[UIColor colorWithHexString:@"#AF1D36"] font:[UIFont systemFontOfSize:11] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [_bgViews addSubview:_subscribeNumber];
        
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_bgViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(13);
        make.right.mas_equalTo(self.mas_right).offset(-13);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
        make.top.mas_equalTo(self.mas_top).offset(5);
    }];
    
    [_times mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bgViews.mas_centerY).offset(0);
        make.left.mas_equalTo(self.bgViews.mas_left).offset(13);
    }];
    
    [_lines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgViews.mas_top).offset(16);
        make.bottom.mas_equalTo(self.bgViews.mas_bottom).offset(-16);
        make.left.mas_equalTo(self.times.mas_right).offset(12);
        make.width.mas_offset(@1);
    }];
    
    [_iconImages mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lines.mas_right).offset(13);
        make.centerY.mas_equalTo(self.bgViews.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(33, 33));
    }];
    
    [_curriculumTitles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImages.mas_right).offset(15);
        make.top.mas_equalTo(self.bgViews.mas_top).offset(18);
    }];
    
    [_lecturerTitles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImages.mas_right).offset(15);
        make.bottom.mas_equalTo(self.bgViews.mas_bottom).offset(-18);
    }];
    
    [_nodeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bgViews.mas_right).offset(-14);
        make.centerY.mas_equalTo(self.curriculumTitles.mas_centerY).offset(0);
        
    }];
    
    [_subscribeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bgViews.mas_right).offset(-14);
        make.centerY.mas_equalTo(self.lecturerTitles.mas_centerY).offset(0);
    }];
    
    
}




@end
