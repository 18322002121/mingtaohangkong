//
//  JobWantedTabBarController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "JobWantedTabBarController.h"

@interface JobWantedTabBarController ()

@end

@implementation JobWantedTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVc];
    [self addTabarItems];
}

#pragma mark-添加导航控制器
- (void)addChildVc{
//    BaseNavigationController *one=[[BaseNavigationController alloc]initWithRootViewController:[[HomePageViewController alloc]init]];
//
//    BaseNavigationController *two=[[BaseNavigationController alloc]initWithRootViewController:[[CurriculumViewController alloc]init]];
//
//    BaseNavigationController *three=[[BaseNavigationController alloc]initWithRootViewController:[[InformationViewController alloc]init]];
//
//    BaseNavigationController *four=[[BaseNavigationController alloc]initWithRootViewController:[[LiveBroadcastViewController alloc]init]];
//
//    BaseNavigationController *five=[[BaseNavigationController alloc]initWithRootViewController:[[MineViewController alloc]init]];
//    
//    self.viewControllers=@[one,two,three,four,five];
}

- (void)addTabarItems
{
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"首页",
                                                 @"TabBarItemImage" : @"ic_home",
                                                 @"TabBarItemSelectedImage" : @"ic_home_down",
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"课程",
                                                  @"TabBarItemImage" : @"jiaju",
                                                  @"TabBarItemSelectedImage" : @"jiaju_down",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"资讯",
                                                 @"TabBarItemImage" : @"gouwuche",
                                                 @"TabBarItemSelectedImage" : @"gouwuche_down",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"直播",
                                                  @"TabBarItemImage" : @"zhuangxiu",
                                                  @"TabBarItemSelectedImage" : @"zhuangxiu_down"
                                                  };
    NSDictionary *fifthTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"我的",
                                                 @"TabBarItemImage" : @"center",
                                                 @"TabBarItemSelectedImage" : @"center_down"
                                                 };
    NSArray<NSDictionary *>  *tabBarItemsAttributes = @[    firstTabBarItemsAttributes,
                                                            secondTabBarItemsAttributes,
                                                            thirdTabBarItemsAttributes,
                                                            fourthTabBarItemsAttributes,
                                                            fifthTabBarItemsAttributes
                                                            ];
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.tabBarItem.title = tabBarItemsAttributes[idx][@"TabBarItemTitle"];
        obj.tabBarItem.image = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemImage"]];
        obj.tabBarItem.selectedImage = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemSelectedImage"]];
        obj.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    }];
    
    self.tabBar.tintColor = [UIColor blackColor];
}
@end
