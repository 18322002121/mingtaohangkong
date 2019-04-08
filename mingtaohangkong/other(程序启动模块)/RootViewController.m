//
//  RootViewController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"

@interface RootViewController ()

@property(nonatomic,strong)PublicLabel *selectLabel;
@property(nonatomic,strong)PublicButton *studyButton;
@property(nonatomic,strong)PublicButton *jobWantedButton;
@property(nonatomic,strong)PublicButton *recruitButton;

@end

@implementation RootViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadingViews];
    [HCYRequestManager appLoginBanner_type:@"1" success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
}

#pragma mark - 加载视图

- (void)loadingViews{
    
//    self.navigationController.navigationBar.hidden = YES;

    _selectLabel = [PublicLabel labelWithText:@"请选择当前你进入名淘航空的身份" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.view addSubview:_selectLabel];
    [_selectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(70);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(0);
    }];
    
    _studyButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"我要学习" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:15.0]  backgroundColor:[UIColor colorWithHexString:@"#DEDEDE"] addView:self.view target:self action:@selector(studyClick)];
    [_studyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.selectLabel.mas_bottom).offset(48);
        make.left.mas_equalTo(self.view.mas_left).offset(36);
        make.right.mas_equalTo(self.view.mas_right).offset(-36);
        make.height.mas_offset(@129);
    }];
    
    _jobWantedButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"我要求职" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:15.0]  backgroundColor:[UIColor colorWithHexString:@"#DEDEDE"] addView:self.view target:self action:@selector(jobWantedClick)];
    [_jobWantedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.studyButton.mas_bottom).offset(52);
        make.left.mas_equalTo(self.view.mas_left).offset(36);
        make.right.mas_equalTo(self.view.mas_right).offset(-36);
        make.height.mas_offset(@129);
    }];
    
    _recruitButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"我要招聘" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:15.0]  backgroundColor:[UIColor colorWithHexString:@"#DEDEDE"] addView:self.view target:self action:@selector(recruitClick)];
    [_recruitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.jobWantedButton.mas_bottom).offset(52);
        make.left.mas_equalTo(self.view.mas_left).offset(36);
        make.right.mas_equalTo(self.view.mas_right).offset(-36);
        make.height.mas_offset(@129);
    }];

}

#pragma mark - 选择用户身份

- (void)studyClick{
    
    LoginViewController *loginVc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVc animated:YES];
    
}

- (void)jobWantedClick{
    LoginViewController *loginVc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVc animated:YES];
}

- (void)recruitClick{
    
}


@end
