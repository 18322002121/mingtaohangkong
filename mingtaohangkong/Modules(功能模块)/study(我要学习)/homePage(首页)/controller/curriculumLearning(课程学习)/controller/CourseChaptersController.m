//
//  CourseChaptersController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseChaptersController.h"
#import "CourseChaptersCell.h"
#import "CourseChaptersHeaderView.h"
#import "CourseChaptersModel.h"

@interface CourseChaptersController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@end

static NSString *const courseChaptersCell = @"CourseChaptersCell";
@implementation CourseChaptersController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"章节";
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self createDatas];
}

- (void)createDatas{
    NSArray *datas = @[
                       @{
                           @"className": @"1601班",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"博爱01",
                                       @"age":@(18),
                                       },
                                   @{
                                       @"name":@"博爱02",
                                       @"age":@(19),
                                       },
                                   @{
                                       @"name":@"博爱03",
                                       @"age":@(15),
                                       },
                                   @{
                                       @"name":@"博爱04",
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
//    BA_WEAKSELF;
//    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        DemoVC2_02_classModel *model = [[DemoVC2_02_classModel alloc] initWithDictionary:obj];
//        model.expend = NO;
//
//        [weakSelf.classModels addObject:model];
//    }];
    NSLog(@"%@",datas);
    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        CourseChaptersModel *models = [CourseChaptersModel ]
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *normalCell = nil;
    CourseChaptersCell *cell =[tableView dequeueReusableCellWithIdentifier:courseChaptersCell forIndexPath:indexPath];
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
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}







@end
