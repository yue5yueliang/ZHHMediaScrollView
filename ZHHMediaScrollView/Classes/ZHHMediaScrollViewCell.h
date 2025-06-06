//
//  ZHHMediaScrollViewCell.h
//  ZHHAnneKitExample
//
//  Created by 桃色三岁 on 2022/5/11.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHHMediaScrollViewCell : UIView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier;

// 唯一标识
@property (nonatomic, readonly, copy, nullable) NSString *reuseIdentifier;

// 准备重用时调用
- (void)prepareForReuse NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
