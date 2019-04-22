//
//  RegisterViewController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property(nonatomic,strong)UIImageView *phoneIcon;
@property(nonatomic,strong)PublicTextfield *phoneNumberTextfield;//手机号输入框
@property(nonatomic,strong)PublicLabel *lineOne;
@property(nonatomic,strong)UIImageView *verificationIcon;
@property(nonatomic,strong)PublicTextfield *verificationCodeTextfield;//验证码输入框
@property(nonatomic,strong)PublicButton *sendVerificationCode;//发送验证码
@property(nonatomic,strong)PublicLabel *lineTwo;
@property(nonatomic,strong)UIImageView *passwordIcon;
@property(nonatomic,strong)PublicTextfield *passwordTextfield;
@property(nonatomic,strong)PublicButton *passwordHidden;
@property(nonatomic,strong)PublicLabel *lineThree;
@property(nonatomic,strong)PublicButton *sureButton;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadingViews];
}




- (void)loadingViews{
    
    self.title = @"注册";
    
    _phoneIcon = [[UIImageView alloc]init];
    _phoneIcon.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:_phoneIcon];
    [_phoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(52);
        make.top.mas_equalTo(self.view.mas_top).offset(42);
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
    
    _passwordIcon = [[UIImageView alloc]init];
    _passwordIcon.image = [UIImage imageNamed:@"password"];
    [self.view addSubview:_passwordIcon];
    [_passwordIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(52);
        make.top.mas_equalTo(self.lineTwo.mas_bottom).offset(23);
        make.size.mas_equalTo(CGSizeMake(12, 15));
    }];
    
    _passwordTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:YES placeholder:@"输入密码" clearsOnBeginEditing:YES];
    [_passwordTextfield setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_passwordTextfield];
    _passwordTextfield.borderStyle = UITextBorderStyleNone;
    [_passwordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.passwordIcon.mas_centerY).offset(0);
        make.left.mas_equalTo(self.passwordIcon.mas_right).offset(8);
        make.right.mas_equalTo(self.view.mas_right).offset(-80);
        make.height.mas_offset(@20);
    }];

    _passwordHidden = [PublicButton buttonWithImage:@"closedeyes" backgroundImageImage:@"" title:@"" titleColor:[UIColor colorWithHexString:@"#AF1D36"] textFont:[UIFont systemFontOfSize:13.0]  backgroundColor:[UIColor clearColor] addView:self.view target:self action:@selector(passwordHiddenClick:)];
    [_passwordHidden mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.passwordIcon.mas_centerY).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(-62);
        make.size.mas_equalTo(CGSizeMake(15, 8));
    }];

    _lineThree = [PublicLabel labelWithText:@"" textColor:[UIColor colorWithHexString:@"#E5E5E5"] font:[UIFont systemFontOfSize:14.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithHexString:@"#E5E5E5"]];
    [self.view addSubview:_lineThree];
    [_lineThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordIcon.mas_bottom).offset(18);
        make.left.mas_equalTo(self.view.mas_left).offset(26);
        make.right.mas_equalTo(self.view.mas_right).offset(-24);
        make.height.mas_offset(@1);
    }];
    
    _sureButton = [PublicButton buttonWithImage:@"" backgroundImageImage:@"" title:@"确定" titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textFont:[UIFont systemFontOfSize:14.0]  backgroundColor:[UIColor colorWithHexString:@"#AF1D36"] addView:self.view target:self action:@selector(sureClick)];
    _sureButton.layer.cornerRadius = 20;
    [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineThree.mas_bottom).offset(34);
        make.left.mas_equalTo(self.view.mas_left).offset(45);
        make.right.mas_equalTo(self.view.mas_right).offset(-45);
        make.height.mas_offset(@40);
    }];
    
    
}

#pragma mark - 发送验证码

- (void)sendVerificationCodeClick{
    
}

#pragma mark - 密码显示与隐藏

- (void)passwordHiddenClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    
    if (sender.selected) { // 按下去了就是明文
        
        NSString *tempPwdStr = self.passwordTextfield.text;
        self.passwordTextfield.text = @""; // 这句代码可以防止切换的时候光标偏移
        self.passwordTextfield.secureTextEntry = NO;
        self.passwordTextfield.text = tempPwdStr;
        
    } else { // 暗文
        
        NSString *tempPwdStr = self.passwordTextfield.text;
        self.passwordTextfield.text = @"";
        self.passwordTextfield.secureTextEntry = YES;
        self.passwordTextfield.text = tempPwdStr;
    }
}

#pragma mark - 确定按钮

- (void)sureClick{
    
}


@end
