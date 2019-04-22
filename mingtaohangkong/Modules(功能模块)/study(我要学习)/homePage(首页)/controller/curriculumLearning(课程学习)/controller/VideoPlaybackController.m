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


@interface VideoPlaybackController ()
@property(nonatomic,strong)PublicTableView *tableView;
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

- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)style:(UITableViewStyleGrouped)];
        [self.tableView registerClass:[CourseChaptersCell class] forCellReuseIdentifier:courseChaptersCell];
        [self.tableView registerClass:[CourseRecommendationCell class] forCellReuseIdentifier:courseRecommendationCell];
        [self.tableView registerClass:[VideoPlaybackHeaderView class] forHeaderFooterViewReuseIdentifier:videoPlaybackHeaderView];
        [self.tableView registerClass:[VideoPlaybackDetailHeaderView class] forHeaderFooterViewReuseIdentifier:videoPlaybackDetailHeaderView];
        [self reloadTableviewDatasource:_tableView];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)reloadTableviewDatasource:(PublicTableView *)tableviews{
    tableviews.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView * _Nonnull tableView) {
        return 2;
    };
    
    tableviews.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 3;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        if (indexPath.section == 0) {
            CourseChaptersCell *cell =[tableView dequeueReusableCellWithIdentifier:courseChaptersCell forIndexPath:indexPath];
            normalCell = cell;
        }else{
            CourseRecommendationCell *cell =[tableView dequeueReusableCellWithIdentifier:courseRecommendationCell forIndexPath:indexPath];
            normalCell = cell;
        }
        return normalCell;
    };
    
    tableviews.rowHeight = 50;
    
    tableviews.heightForHeaderInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        if (section == 0) {
            return 275;
        }else{
            return 40;
        }
    };
    
    tableviews.viewForHeaderInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        if (section == 0) {
            VideoPlaybackHeaderView *videoPlayView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:videoPlaybackHeaderView];
            return videoPlayView;
        }else{
            VideoPlaybackDetailHeaderView *videoPlayView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:videoPlaybackDetailHeaderView];
            return videoPlayView;
        }
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
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        if (indexPath.section == 0) {
            return 45;
        }else{
            return 132;
        }
    };
}








@end
