//
//  ZHHViewController.m
//  ZHHMediaScrollView
//
//  Created by 桃色三岁 on 06/06/2025.
//  Copyright (c) 2025 桃色三岁. All rights reserved.
//

#import "ZHHViewController.h"
#import "ZHHMediaLiveScrollViewCell.h"
#import <ZHHMediaScrollView/ZHHMediaScrollView.h>

@interface ZHHViewController () <ZHHMediaScrollViewDataSource, ZHHMediaScrollViewDelegate>
@property (nonatomic, strong) ZHHMediaScrollView *scrollView;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ZHHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.scrollView];

    // 关闭 autoresizing 转换（必要）
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;

    // 添加约束
    [NSLayoutConstraint activateConstraints:@[
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
    ]];
    
    [self.scrollView reloadData];
}

#pragma mark - ZHHMediaScrollViewDataSource

/**
 * 获取滚动视图中的总行数
 *
 * @param scrollView 当前的 ZHHMediaScrollView 实例
 * @return 数据源的总数量
 */
- (NSInteger)numberOfRowsInScrollView:(ZHHMediaScrollView *)scrollView {
    return self.dataSource.count + 100;
}

/**
 * 获取指定索引的 Cell
 *
 * @param scrollView 当前的 ZHHMediaScrollView 实例
 * @param indexPath  当前索引路径
 * @return 对应索引的 ZHHMediaScrollViewCell 实例
 */
- (ZHHMediaScrollViewCell *)scrollView:(ZHHMediaScrollView *)scrollView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 通过标识符从缓存池中获取可复用的 cell
    ZHHMediaLiveScrollViewCell *cell = [scrollView dequeueReusableCellWithIdentifier:@"ZHHMediaLiveScrollViewCell" forIndexPath:indexPath];

    // 配置 cell 内容（此处暂未传入具体 model，可根据业务需求修改）

    cell.textLabel.text = [NSString stringWithFormat:@"indexPath - %ld", indexPath.item];
    return cell;
}

#pragma mark - ZHHMediaScrollViewDelegate

/**
 * 即将显示指定索引的 Cell
 *
 * @param scrollView 当前的 ZHHMediaScrollView 实例
 * @param cell       即将显示的 ZHHMediaScrollViewCell 实例
 * @param indexPath  当前索引路径
 */
- (void)scrollView:(ZHHMediaScrollView *)scrollView willDisplayCell:(ZHHMediaScrollViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    ZHHUILog(@"即将显示 cell -----%zd---%@", indexPath.row, cell);
}

/**
 * 指定索引的 Cell 结束显示
 *
 * @param scrollView 当前的 ZHHMediaScrollView 实例
 * @param cell       结束显示的 ZHHMediaScrollViewCell 实例
 * @param indexPath  当前索引路径
 */
- (void)scrollView:(ZHHMediaScrollView *)scrollView didEndDisplayingCell:(ZHHMediaScrollViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    ZHHUILog(@"结束显示 cell -----%zd---%@", indexPath.row, cell);
}

/**
 * 滚动停止后，最终显示的 Cell
 *
 * @param scrollView 当前的 ZHHMediaScrollView 实例
 * @param cell       当前最终可见的 ZHHMediaScrollViewCell 实例
 * @param indexPath  当前索引路径
 */
- (void)scrollView:(ZHHMediaScrollView *)scrollView didEndScrollingCell:(ZHHMediaScrollViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    ZHHUILog(@"滑动结束显示 -----%zd---%@", indexPath.row, cell);

    // 模拟自动加载逻辑：
    // 当数据源中剩余的条目小于等于 5 时，自动请求下一页数据
    if (self.dataSource.count - self.scrollView.currentIndex <= 5) {
        self.page++;
//        [self loadLiveRoomData];
    }
}

#pragma mark - Lazy
- (ZHHMediaScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[ZHHMediaScrollView alloc] init];
        _scrollView.dataSource = self;
        _scrollView.delegate = self;
        _scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [_scrollView registerClass:[ZHHMediaLiveScrollViewCell class] forCellReuseIdentifier:@"ZHHMediaLiveScrollViewCell"];
    }
    return _scrollView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
