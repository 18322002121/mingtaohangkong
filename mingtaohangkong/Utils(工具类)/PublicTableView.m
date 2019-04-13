//
//  PublicTableView.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PublicTableView.h"
@interface PublicTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation PublicTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.estimatedRowHeight = 200;
        self.rowHeight = UITableViewAutomaticDimension;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.numberOfSectionsInTableViewBlock ? self.numberOfSectionsInTableViewBlock(tableView) : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberOfRowsInSectionBlock ? self.numberOfRowsInSectionBlock(tableView, section) : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellForRowAtIndexPathBlock(tableView, indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.heightForHeaderInSectionBlock ? self.heightForHeaderInSectionBlock(tableView, section) : 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.heightForFooterInSectionBlock ? self.heightForFooterInSectionBlock(tableView, section) : 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.viewForHeaderInSectionBlock ? self.viewForHeaderInSectionBlock(tableView, section) : (UIView*)[UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.viewForFooterInSectionBlock ? self.viewForFooterInSectionBlock(tableView, section) : (UIView*)[UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return !self.didSelectRowAtIndexPathBlock ? :self.didSelectRowAtIndexPathBlock(tableView, indexPath);
}





@end
