//
//  SettingViewController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "SettingViewController.h"
#import "MineCell.h"
#import "ModuleSelectionModel.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *moduleSelectionArray;
@end
static NSString *const mineCell =@"MineCell";
@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self moduleSelection];
    self.title = @"设置";
}

#pragma mark - 请求数据
- (void)moduleSelection{
    NSArray *dataArray = @[@{@"iconImage":@"study",@"gridTitle":@"清理缓存"},
                           @{@"iconImage":@"grade",@"gridTitle":@"修改密码"},
                           @{@"iconImage":@"test",@"gridTitle":@"关于我们"},
                           @{@"iconImage":@"checkin",@"gridTitle":@"意见反馈"}
                           ];
    self.moduleSelectionArray = [NSMutableArray arrayWithCapacity:0];
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.moduleSelectionArray  addObject:[ModuleSelectionModel initWithDict:obj]];
    }];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor=KWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [_tableView registerClass:[MineCell class] forCellReuseIdentifier:mineCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.moduleSelectionArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *normalCell = nil;
    MineCell *cell =[tableView dequeueReusableCellWithIdentifier:mineCell forIndexPath:indexPath];
    [cell setSelectionModel:self.moduleSelectionArray[indexPath.row]];
    normalCell = cell;
    return normalCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    subView.backgroundColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.91 alpha:1.00];
    return subView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    subView.backgroundColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.91 alpha:1.00];
    return subView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];//当点击cell时有灰色，松开没灰色
}
@end
