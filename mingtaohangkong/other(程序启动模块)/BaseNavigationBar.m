//
//  BaseNavigationBar.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "BaseNavigationBar.h"
@interface HCYSearchBar: UITextField

@end
@interface BaseNavigationBar ()<UITextFieldDelegate>

@property(nonatomic,strong)HCYSearchBar *searchBar;
@property(nonatomic,strong)UIImageView *rightView;

@end

@implementation BaseNavigationBar

+ (instancetype)navigationBar {
    BaseNavigationBar *bar = [[BaseNavigationBar alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, HN_NAVIGATION_BAR_HEIGHT)];
    return bar;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _searchBar = [[HCYSearchBar alloc]init];
        _searchBar.layer.borderWidth = 0.5;
        _searchBar.layer.borderColor = [UIColor colorWithHexString:@"#BFC8E2"].CGColor;
        _searchBar.layer.cornerRadius = 15;
        _searchBar.backgroundColor = [UIColor colorWithHexString:@"#E0E0E0"];
        [_searchBar setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];
        UIImageView *rightView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
        rightView.image = [UIImage imageNamed:@"search"];
        rightView.contentMode = UIViewContentModeCenter;
        _searchBar.rightView = rightView;
        _searchBar.delegate = self;
        _searchBar.placeholder = @"   请输入相关内容/讲师";
        _searchBar.textColor = [UIColor grayColor];
        _searchBar.font = [UIFont systemFontOfSize:12];
        _searchBar.rightViewMode = UITextFieldViewModeAlways;
        [self addSubview:_searchBar];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(34);
        make.right.mas_equalTo(self.mas_right).offset(-34);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.height.mas_equalTo(32);
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}


@end
@implementation HCYSearchBar
- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 8;
    return iconRect;
}
@end
