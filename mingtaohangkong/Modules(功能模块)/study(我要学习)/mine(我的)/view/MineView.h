//
//  MineView.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineView : UIView
@property (nonatomic, strong) void(^settingBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
