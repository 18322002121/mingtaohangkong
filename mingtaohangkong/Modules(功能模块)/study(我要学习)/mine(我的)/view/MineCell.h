//
//  MineCell.h
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModuleSelectionModel;
NS_ASSUME_NONNULL_BEGIN

@interface MineCell : UITableViewCell
@property(nonatomic,strong)ModuleSelectionModel *selectionModel;
@end

NS_ASSUME_NONNULL_END
