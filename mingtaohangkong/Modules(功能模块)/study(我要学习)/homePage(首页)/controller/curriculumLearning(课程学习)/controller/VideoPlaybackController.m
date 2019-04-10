//
//  VideoPlaybackController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "VideoPlaybackController.h"
#import "CourseChaptersCell.h"
#import "VideoPlaybackHeaderView.h"

@interface VideoPlaybackController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

static NSString *const courseChaptersCell = @"CourseChaptersCell";
static NSString *const videoPlaybackHeaderView = @"VideoPlaybackHeaderView";
@implementation VideoPlaybackController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.title = @"视频播放";
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
        [self.tableView registerClass:[VideoPlaybackHeaderView class] forHeaderFooterViewReuseIdentifier:videoPlaybackHeaderView];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *normalCell = nil;
    CourseChaptersCell *cell =[tableView dequeueReusableCellWithIdentifier:courseChaptersCell forIndexPath:indexPath];
//    CourseChaptersModel *sectionModel = _dataArray[indexPath.section];
//    Students *rowModel = sectionModel.students[indexPath.row];
//    [cell setStudentsModel:rowModel];
    normalCell = cell;
    return normalCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 210;
    }else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    VideoPlaybackHeaderView *videoPlayView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:videoPlaybackHeaderView];
    return videoPlayView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
