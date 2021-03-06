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
    /** 检测网络状态 */
    [self checkworking];
    /*! 设置CGRectZero从导航栏下开始计算 */
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    /** 请求网络并行异步加载 */
    [self parallelAsynchronous];
    self.automaticallyAdjustsScrollViewInsets = NO;
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

#pragma mark - 检测网络状态

- (void)checkworking{
    AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];
    [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case 0:
                [MBProgressHUD showMessag:@"请检查您的网络!" toView:self.view];
                break;
            case 1:
                NSLog(@"蜂窝数据");
            case 2:
                NSLog(@"wifi网络");
            default:
                break;
        }
    }];
    [manger startMonitoring];
}

#pragma mark - 请求网络并行异步加载

- (void)parallelAsynchronous{
    
    dispatch_queue_t queue= dispatch_queue_create("hcy", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        [self networkRequest];
    });
    
}

- (void)networkRequest{
    
}

@end
