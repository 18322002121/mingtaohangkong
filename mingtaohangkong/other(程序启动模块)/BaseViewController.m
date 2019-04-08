//
//  BaseViewController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UINavigationControllerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.jz_navigationBarBackgroundAlpha = 0;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (BaseNavigationBar *)showCustomNavBar {
    self.navigationController.navigationBar.hidden = YES;
    BaseNavigationBar *bar = [BaseNavigationBar navigationBar];
    [self.view addSubview:bar];
    return bar;
}

@end
