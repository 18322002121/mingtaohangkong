//
//  CourseChaptersModel.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Students :NSObject
@property (nonatomic , copy) NSString              * age;
@property (nonatomic , copy) NSString              * name;

@end

@interface CourseChaptersModel :NSObject
@property (nonatomic , copy) NSString              * className;
@property (nonatomic , copy) NSArray<Students *>              * students;

@end

NS_ASSUME_NONNULL_END
