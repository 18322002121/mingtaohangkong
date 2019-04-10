//
//  CourseChaptersModel.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CourseChaptersModel.h"

@implementation Students

@end
@implementation CourseChaptersModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"students" : [Students class]};
}
@end
