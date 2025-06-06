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

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    [self addSubview:self.textLabel];
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        [self.textLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.textLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
    ]];
}

#pragma mark - Lazy
- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:16];
        _textLabel.textColor = UIColor.whiteColor;
    }
    return _textLabel;
}

@end
