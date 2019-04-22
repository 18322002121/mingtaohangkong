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

@interface CourseChaptersController ()
@property (nonatomic,strong)PublicTableView *tableView;
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
                                       @"name":@"05.  航空服务学习礼仪的重要性",
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

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight  - kTabBarHeight)style:(UITableViewStyleGrouped)];
        [_tableView registerClass:[CourseChaptersCell class] forCellReuseIdentifier:courseChaptersCell];
        [self reloadTableviewDatasource:_tableView];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)reloadTableviewDatasource:(PublicTableView *)tableviews{
    tableviews.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView * _Nonnull tableView) {
        return self.dataArray.count;
    };
    
    tableviews.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        CourseChaptersModel *model = self.dataArray[section];
        return model.students.count;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        CourseChaptersCell *cell =[tableView dequeueReusableCellWithIdentifier:courseChaptersCell forIndexPath:indexPath];
        CourseChaptersModel *sectionModel = self.dataArray[indexPath.section];
        Students *rowModel = sectionModel.students[indexPath.row];
        [cell setStudentsModel:rowModel];
        normalCell = cell;
        return normalCell;
    };
    
    tableviews.rowHeight = 45;
    
    tableviews.heightForHeaderInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 45;
    };
    
    tableviews.viewForHeaderInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        CourseChaptersHeaderView *headerView = [[CourseChaptersHeaderView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 45)];
        headerView.OpenAndCloseButton = ^(UIButton * _Nonnull sender) {
            NSLog(@"%ld section头部被点击了",(long)section);
        };
        return headerView;
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
        VideoPlaybackController *videoPlayback = [[VideoPlaybackController alloc]init];
        [self.navigationController pushViewController:videoPlayback animated:YES];
    };
    
}



@end
