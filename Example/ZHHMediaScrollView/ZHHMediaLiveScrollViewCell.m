//
//  ZHHMediaLiveScrollViewCell.m
//  ZHHAnneKitExample
//
//  Created by 桃色三岁 on 2025/3/25.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHMediaLiveScrollViewCell.h"

@implementation ZHHMediaLiveScrollViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    // 添加主标题
    [self addSubview:self.textLabel];
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        // 主标题约束 - 使用cell顶部而不是安全区域，这样会完全跟随cell滑动
        [self.textLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.textLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:20]
    ]];
}

#pragma mark - Lazy
- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont boldSystemFontOfSize:20];
        _textLabel.textColor = UIColor.whiteColor;
        _textLabel.text = @"直播间";
    }
    return _textLabel;
}

@end

