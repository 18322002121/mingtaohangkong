//
//  CourseChaptersController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseChaptersController.h"
#import "VideoPlaybackController.h"
#import "CourseChaptersCell.h"
#import "CourseChaptersHeaderView.h"
#import "CourseChaptersModel.h"

@interface CourseChaptersController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

static NSString *const courseChaptersCell = @"CourseChaptersCell";
@implementation CourseChaptersController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"章节";
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self createDatas];
}

- (void)createDatas{
    NSArray *datas = @[
                       @{
                           @"className": @"一、 礼仪意识的养成",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"01.  中国礼仪的起源与发展",
                                       @"age":@(18),
                                       },
                                   @{
                                       @"name":@"02.  礼仪的概念与内涵 ",
                                       @"age":@(19),
                                       },
                                   @{
                                       @"name":@"03.  航空服务礼仪 ",
                                       @"age":@(15),
                                       },
                                   @{
                                       @"name":@"04.  学习航空服务礼仪的重要性",
                                       @"age":@(22),
                                       },
                                   @{
                                       @"name":@"博爱05",
                                       @"age":@(25),
                                       }
                                   ]
                           },
                       @{
                           @"className": @"1602班",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"博爱11",
                                       @"age":@(22),
                                       },
                                   @{
                                       @"name":@"博爱12",
                                       @"age":@(19),
                                       },
                                   @{
                                       @"name":@"博爱13",
                                       @"age":@(15),
                                       },
                                   @{
                                       @"name":@"博爱14",
                                       @"age":@(22),
                                       }
                                   ]
                           },
                       @{
                           @"className": @"1603班",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"博爱21",
                                       @"age":@(8),
                                       },
                                   @{
                                       @"name":@"博爱22",
                                       @"age":@(9),
                                       },
                                   @{
                                       @"name":@"博爱23",
                                       @"age":@(5),
                                       },
                                   @{
                                       @"name":@"博爱24",
                                       @"age":@(28),
                                       },
                                   @{
                                       @"name":@"博爱25",
                                       @"age":@(22),
                                       },
                                   @{
                                       @"name":@"博爱26",
                                       @"age":@(26),
                                       }
                                   ]
                           }
                       ];

    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CourseChaptersModel *models = [CourseChaptersModel yy_modelWithDictionary:obj];
        [self.dataArray addObject:models];
    }];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.showsHorizontalScrollIndicator = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
        [self.tableView registerClass:[CourseChaptersCell class] forCellReuseIdentifier:courseChaptersCell];
        
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CourseChaptersModel *model = _dataArray[section];
    return model.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *normalCell = nil;
    CourseChaptersCell *cell =[tableView dequeueReusableCellWithIdentifier:courseChaptersCell forIndexPath:indexPath];
    CourseChaptersModel *sectionModel = _dataArray[indexPath.section];
    Students *rowModel = sectionModel.students[indexPath.row];
    [cell setStudentsModel:rowModel];
    normalCell = cell;
    return normalCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CourseChaptersHeaderView *headerView = [[CourseChaptersHeaderView alloc]init];
    headerView.OpenAndCloseButton = ^(UIButton * _Nonnull sender) {
        NSLog(@"%ld section头部被点击了",(long)section);
    };
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoPlaybackController *videoPlayback = [[VideoPlaybackController alloc]init];
    [self.navigationController pushViewController:videoPlayback animated:YES];
}







@end
