//
//  MessageLoginViewController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MessageLoginViewController.h"
#import "RegisterViewController.h"
#import "StudyTabBarController.h"
#import "LoginViewController.h"

@interface MessageLoginViewController ()
@property(nonatomic,strong)UIImageView *iconImage;//icon图片
@property(nonatomic,strong)UIImageView *phoneIcon;
//@property(nonatomic,strong)PublicLabel *phoneNumber;//手机号
@property(nonatomic,strong)PublicTextfield *phoneNumberTextfield;//手机号输入框
@property(nonatomic,strong)PublicLabel *lineOne;
@property(nonatomic,strong)UIImageView *verificationIcon;
//@property(nonatomic,strong)PublicLabel *password;//密码
@property(nonatomic,strong)PublicTextfield *verificationCodeTextfield;//验证码输入框
@property(nonatomic,strong)PublicButton *sendVerificationCode;//发送验证码
@property(nonatomic,strong)PublicLabel *lineTwo;
@property(nonatomic,strong)PublicButton *loginButton;//登陆
@property(nonatomic,strong)PublicButton *phoneLogin;//手机号验证登陆
//@property(nonatomic,strong)PublicButton *forgetPassword;//忘记密码
@property(nonatomic,strong)PublicButton *toRegister;//立即注册
@end

@implementation MessageLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadingViews];
}

#pragma mark - 加载视图

- (void)loadingViews{
    self.title = @"验证码登录";
    
    _iconImage = [[UIImageView alloc]init];
    _iconImage.image = [UIImage imageNamed:@"logo1"];
    [self.view addSubview:_iconImage];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(128);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(111, 59));
    }];
    
    _phoneIcon = [[UIImageView alloc]init];
    _phoneIcon.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:_phoneIcon];
    [_phoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(52);
        make.top.mas_equalTo(self.iconImage.mas_bottom).offset(92);
        make.size.mas_equalTo(CGSizeMake(12, 15));
    }];
    
    _phoneNumberTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"手机号" clearsOnBeginEditing:YES];
    [_phoneNumberTextfield setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_phoneNumberTextfield];
    _phoneNumberTextfield.borderStyle = UITextBorderStyleNone;
    _phoneNumberTextfield.clearsOnBeginEditing = YES;
    _phoneNumberTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_phoneNumberTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.phoneIcon.mas_centerY).offset(0);
        make.left.mas_equalTo(self.phoneIcon.mas_right).offset(8);
        make.right.mas_equalTo(self.view.mas_right).offset(-55);
        make.height.mas_offset(@20);
    }];
    
    _lineOne = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#E5E5E5"] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#E5E5E5"]];
    [self.view addSubview:_lineOne];
    [_lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneIcon.mas_bottom).offset(19);
        make.left.mas_equalTo(self.view.mas_left).offset(26);
        make.right.mas_equalTo(self.view.mas_right).offset(-24);
        make.height.mas_offset(@1);
    }];
    
    _verificationIcon = [[UIImageView alloc]init];
    _verificationIcon.image = [UIImage imageNamed:@"verification"];
    [self.view addSubview:_verificationIcon];
    [_verificationIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(52);
        make.top.mas_equalTo(self.lineOne.mas_bottom).offset(23);
        make.size.mas_equalTo(CGSizeMake(12, 15));
    }];
    
    _verificationCodeTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:YES placeholder:@"输入验证码" clearsOnBeginEditing:YES];
    [_verificationCodeTextfield setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_verificationCodeTextfield];
    _verificationCodeTextfield.borderStyle = UITextBorderStyleNone;
    [_verificationCodeTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.verificationIcon.mas_centerY).offset(0);
        make.left.mas_equalTo(self.verificationIcon.mas_right).offset(8);
        make.right.mas_equalTo(self.view.mas_right).offset(-140);
        make.height.mas_offset(@20);
    }];
    
    _sendVerificationCode = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"发送验证码" titleColor:[UIColor colorWithHexString:@"#2F77D8"] textFont:[UIFont systemFontOfSize:13.0]  backgroundColor:[UIColor clearColor] addView:self.view target:self action:@selector(sendVerificationCodeClick)];
    [_sendVerificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.verificationIcon.mas_centerY).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(-52);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    _lineTwo = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#E5E5E5"] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#E5E5E5"]];
    [self.view addSubview:_lineTwo];
    [_lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.verificationIcon.mas_bottom).offset(18);
        make.left.mas_equalTo(self.view.mas_left).offset(26);
        make.right.mas_equalTo(self.view.mas_right).offset(-24);
        make.height.mas_offset(@1);
    }];
    
    _loginButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"登陆" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:14.0]  backgroundColor:[UIColor colorWithHexString:@"#AF1D36"] addView:self.view target:self action:@selector(loginClick)];
    _loginButton.layer.cornerRadius = 20;
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineTwo.mas_bottom).offset(34);
        make.left.mas_equalTo(self.view.mas_left).offset(45);
        make.right.mas_equalTo(self.view.mas_right).offset(-45);
        make.height.mas_offset(@40);
    }];
    
    _phoneLogin = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"密码登录" titleColor:[UIColor colorWithHexString:@"#272727"] textFont:[UIFont systemFontOfSize:13.0]  backgroundColor:[UIColor clearColor] addView:self.view target:self action:@selector(phoneLoginClick)];
    [_phoneLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(32);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-30);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    //    _forgetPassword = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"忘记密码？" titleColor:[UIColor colorWithHexString:@"#AF1D36"] textFont:[UIFont systemFontOfSize:13.0]  backgroundColor:[UIColor clearColor] addView:self.view target:self action:@selector(forgetPasswordClick)];
    //    [_forgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(23);
    //        make.right.mas_equalTo(self.view.mas_right).offset(-25);
    //        make.height.mas_offset(@13);
    //    }];
    
    _toRegister = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"立即注册" titleColor:[UIColor colorWithHexString:@"#272727"] textFont:[UIFont systemFontOfSize:13.0]  backgroundColor:[UIColor clearColor] addView:self.view target:self action:@selector(toRegisterClick)];
    //    NSMutableAttributedString* changeString = [[NSMutableAttributedString alloc]initWithString:_toRegister.currentTitle];
    //    [changeString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#0F1B3C"]range:NSMakeRange(0,9)];
    //    [_toRegister setAttributedTitle:changeString forState:UIControlStateNormal];
    [_toRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(32);
        make.left.mas_equalTo(self.view.mas_centerX).offset(30);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
}

#pragma mark - 登陆

- (void)loginClick{
    kRootViewController = [[StudyTabBarController alloc]init];
}

#pragma mark - 手机号验证登陆

- (void)phoneLoginClick{
    LoginViewController *loginVc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVc animated:YES];
}

//#pragma mark - 忘记密码
//
//- (void)forgetPasswordClick{
//    ForgetPasswordViewController *forgetPasswordVc = [[ForgetPasswordViewController alloc]init];
//    [self.navigationController pushViewController:forgetPasswordVc animated:YES];
//}

#pragma mark - 立即注册

- (void)toRegisterClick{
    RegisterViewController *registerVc = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVc animated:YES];
}

#pragma mark - 发送验证码

- (void)sendVerificationCodeClick{
    
}



@end
