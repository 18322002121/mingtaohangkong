//
//  CurriculumViewController.m
//  mingtaohangkong
//
//  Created by Linlin Ge on 2019/3/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "CurriculumViewController.h"

@interface CurriculumViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView        *scrollView;
@property (nonatomic, strong) PublicSegmentedControl  *segmentedControl;
@end

@implementation CurriculumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试";
    [self buildSegment];
    [self reloadShowView];
}
- (void)buildSegment
{
    self.segmentedControl.hidden = NO;
    self.scrollView.hidden       = NO;
    //    self.views1.hidden           = NO;
    //    self.views2.hidden           = NO;
    //    self.views3.hidden           = NO;
    //    self.views4.hidden           = NO;
}

- (PublicSegmentedControl *)segmentedControl
{
    if (!_segmentedControl)
    {
        _segmentedControl                             = [[PublicSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        //        _segmentedControl                           = [[HMSegmentedControl alloc] init];
        
        /*! 设置标题 */
        _segmentedControl.sectionTitles               = @[@"最新",@"排行榜",@"手机",@"新闻",@"游戏",@"数码",@"段子",@"科技"];
        /*! 自适应宽度，随着屏幕滑动自动滚动 */
        _segmentedControl.autoresizingMask            = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        /*! 默认选中第0个view */
        _segmentedControl.selectedSegmentIndex        = 0;
        /*! 标题背景颜色 */
        _segmentedControl.backgroundColor             = kRandomColor;
        /*! 标题默认字体颜色 */
        _segmentedControl.titleTextAttributes         = @{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName: [UIFont systemFontOfSize:15]};
        /*! 标题选中字体颜色 */
        _segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:18]};
        /*! 标题选中的下划线的颜色 */
        _segmentedControl.selectionIndicatorColor     = [UIColor blackColor];
        /*! 标题选中的下划线的高度 */
        _segmentedControl.selectionIndicatorHeight    = 2.0f;
        /*! 标题选中的样式：本样式为下划线 */
        _segmentedControl.selectionStyle              = HMSegmentedControlSelectionStyleFullWidthStripe;
        /*! 标题选中的下划线的方向：本样式为向下 */
        _segmentedControl.selectionIndicatorLocation  = HMSegmentedControlSelectionIndicatorLocationDown;
        /*! 标题的中间的隔线：默认为：NO */
        _segmentedControl.verticalDividerEnabled      = YES;
        /*! 标题的中间的隔线颜色 */
        _segmentedControl.verticalDividerColor        = [UIColor lightGrayColor];
        /*! 标题的中间的隔线宽度 */
        _segmentedControl.verticalDividerWidth        = 1.0f;
        
        /*! 标题点击事件 */
        //        BA_WEAKSELF;
        __weak typeof(self)weakSelf = self;
        [_segmentedControl setIndexChangeBlock:^(NSInteger index) {
            [weakSelf.scrollView scrollRectToVisible:CGRectMake(weakSelf.view.frame.size.width * index, 0, weakSelf.view.frame.size.width, weakSelf.scrollView.frame.size.height) animated:YES];
        }];
        [self.view addSubview:_segmentedControl];
    }
    return _segmentedControl;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        /*! 这里的frame按实际情况更改！ */
        self.scrollView                                = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-104)];
        self.scrollView.backgroundColor                = [UIColor whiteColor];
        self.scrollView.pagingEnabled                  = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.bounces                        = NO;
        self.scrollView.contentSize                    = CGSizeMake(self.view.frame.size.width * (_segmentedControl.sectionTitles.count), self.scrollView.frame.size.height);
        self.scrollView.delegate                       = self;
        self.scrollView.backgroundColor                = [UIColor greenColor];
        
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, self.view.frame.size.width, self.scrollView.frame.size.height) animated:NO];
        [self.view addSubview:self.scrollView];
        
    }
    return _scrollView;
}

#pragma mark - ***** UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [_segmentedControl setSelectedSegmentIndex:page animated:YES];
}

- (void)reloadShowView{
    for (int i = 0; i<4; i++) {
        UIView *showView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.scrollView.frame.size.height)];
        showView.backgroundColor = kRandomColor;
        [self.scrollView addSubview:showView];
    }
}


@end
