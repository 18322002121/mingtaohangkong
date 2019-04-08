//
//  ModuleSelectionModel.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/29.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "ModuleSelectionModel.h"

@implementation ModuleSelectionModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self=[super init]) {
        self.gridTitle=dict[@"gridTitle"];
        self.iconImage=dict[@"iconImage"];
        self.controller=dict[@"controller"];
    }
    return self;
}
+ (instancetype)initWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}
@end
