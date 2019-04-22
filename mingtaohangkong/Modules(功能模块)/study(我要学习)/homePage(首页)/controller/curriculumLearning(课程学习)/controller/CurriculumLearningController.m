//
//  CurriculumLearningController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/29.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CurriculumLearningController.h"
#import "CourseRecommendationController.h"
#import "CurriculumLearningCell.h"

@interface CurriculumLearningController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end
static NSString *const curriculumLearningCell = @"CurriculumLearningCell";
@implementation CurriculumLearningController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程学习";
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor=KWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [_tableView registerClass:[CurriculumLearningCell class] forCellReuseIdentifier:curriculumLearningCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *normalCell = nil;
    CurriculumLearningCell *cell =[tableView dequeueReusableCellWithIdentifier:curriculumLearningCell forIndexPath:indexPath];
    normalCell = cell;
    return normalCell;
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
    CourseRecommendationController *courseRecommendation = [[CourseRecommendationController alloc]init];
    [self.navigationController pushViewController:courseRecommendation animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 101;
}

@end
