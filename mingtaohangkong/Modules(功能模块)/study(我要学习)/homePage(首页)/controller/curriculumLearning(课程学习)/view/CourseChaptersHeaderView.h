//
//  CourseChaptersHeaderView.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/4/9.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseChaptersHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) void(^OpenAndCloseButton)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
