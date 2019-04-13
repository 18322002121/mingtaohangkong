//
//  MineViewController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "MineViewController.h"
#import "MineCell.h"
#import "MineView.h"
#import "SettingViewController.h"
#import "ModuleSelectionModel.h"

@interface MineViewController ()
@property(nonatomic,strong)PublicTableView *tableView;
@property(nonatomic,strong)NSMutableArray *moduleSelectionArray;
@end

static NSString *const mineCell =@"MineCell";
@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self moduleSelection];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    self.tableView.mj_header = [PublicRefreshHeader headerWithRefreshingBlock:^{
//        [self.datas removeAllObjects];
//        NSArray *datas = [self hn_modelArrayWithCategory:self.model.category fromModel:x];
//        [self.datas addObjectsFromArray:datas];
//        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    
//    self.tableView.mj_footer = [PublicRefreshFooter footerWithRefreshingBlock:^{
//        if (datas.count == 0 || !datas) {
//            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//        }else {
//            [self.datas addObjectsFromArray:datas];
            [self.tableView.mj_footer endRefreshing];
//        }
//    }];
    [self.tableView.mj_header beginRefreshing];
    
    
}

- (void)moduleSelection{
    NSArray *dataArray = @[@{@"iconImage":@"study",@"gridTitle":@"学习记录"},
                           @{@"iconImage":@"grade",@"gridTitle":@"签到记录"},
                           @{@"iconImage":@"test",@"gridTitle":@"购买记录"},
                           @{@"iconImage":@"checkin",@"gridTitle":@"检测更新"},
                           @{@"iconImage":@"checkin",@"gridTitle":@"切换身份"}
                           ];
    self.moduleSelectionArray = [NSMutableArray arrayWithCapacity:0];
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.moduleSelectionArray  addObject:[ModuleSelectionModel initWithDict:obj]];
    }];
}

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)style:(UITableViewStyleGrouped)];
        [_tableView registerClass:[MineCell class] forCellReuseIdentifier:mineCell];
        [self reloadTableviewDatasource:_tableView];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)reloadTableviewDatasource:(PublicTableView *)tableviews{
    tableviews.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView * _Nonnull tableView) {
        return 1;
    };
    
    tableviews.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 5;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        MineCell *cell =[tableView dequeueReusableCellWithIdentifier:mineCell forIndexPath:indexPath];
        [cell setSelectionModel:self.moduleSelectionArray[indexPath.row]];
        normalCell = cell;
        return normalCell;
    };
    
    tableviews.heightForHeaderInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 243;
    };
    
    tableviews.viewForHeaderInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        MineView *subView=[[MineView alloc]init];
        subView.settingBlock = ^(UIButton * _Nonnull sender) {
            SettingViewController *settingView = [[SettingViewController alloc]init];
            [self.navigationController pushViewController:settingView animated:YES];
        };
        return subView;
    };
    
    tableviews.heightForFooterInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 0.01;
    };
    
    tableviews.viewForFooterInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
        subView.backgroundColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.91 alpha:1.00];
        return subView;
    };
    
    tableviews.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];//当点击cell时有灰色，松开没灰色
    };
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:0.67 green:0.14 blue:0.23 alpha:1.00]];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self setStatusBarBackgroundColor:[UIColor clearColor]];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

@end
