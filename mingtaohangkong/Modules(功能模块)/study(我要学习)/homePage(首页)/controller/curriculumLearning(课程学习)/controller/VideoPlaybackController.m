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
#import "CourseRecommendationCell.h"
#import "VideoPlaybackDetailHeaderView.h"

@interface VideoPlaybackController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

static NSString *const courseChaptersCell = @"CourseChaptersCell";
static NSString *const courseRecommendationCell = @"CourseRecommendationCell";
static NSString *const videoPlaybackHeaderView = @"VideoPlaybackHeaderView";
static NSString *const videoPlaybackDetailHeaderView = @"VideoPlaybackDetailHeaderView";

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
        [self.tableView registerClass:[CourseRecommendationCell class] forCellReuseIdentifier:courseRecommendationCell];
        [self.tableView registerClass:[VideoPlaybackHeaderView class] forHeaderFooterViewReuseIdentifier:videoPlaybackHeaderView];
        [self.tableView registerClass:[VideoPlaybackDetailHeaderView class] forHeaderFooterViewReuseIdentifier:videoPlaybackDetailHeaderView];
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
    if (indexPath.section == 0) {
        CourseChaptersCell *cell =[tableView dequeueReusableCellWithIdentifier:courseChaptersCell forIndexPath:indexPath];
        normalCell = cell;
    }else{
        CourseRecommendationCell *cell =[tableView dequeueReusableCellWithIdentifier:courseRecommendationCell forIndexPath:indexPath];
        normalCell = cell;
    }
    
    
//    CourseChaptersModel *sectionModel = _dataArray[indexPath.section];
//    Students *rowModel = sectionModel.students[indexPath.row];
//    [cell setStudentsModel:rowModel];
    return normalCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 45;
    }else{
        return 132;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 275;
    }else{
        return 40;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        VideoPlaybackHeaderView *videoPlayView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:videoPlaybackHeaderView];
        return videoPlayView;
    }else{
        VideoPlaybackDetailHeaderView *videoPlayView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:videoPlaybackDetailHeaderView];
        return videoPlayView;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
