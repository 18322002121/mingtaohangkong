//
//  ModuleSelectionModel.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/29.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModuleSelectionModel : NSObject
@property (nonatomic,strong) NSString *gridTitle;
@property (nonatomic,strong) NSString *iconImage;
@property (nonatomic,strong) NSString *controller;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
