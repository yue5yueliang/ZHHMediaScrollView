//
//  ZHHMediaScrollViewCell.m
//  ZHHAnneKitExample
//
//  Created by 桃色三岁 on 2022/5/11.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHMediaScrollViewCell.h"

@interface ZHHMediaScrollViewCell()

@property (nonatomic, copy) IBInspectable NSString *reuseIdentifier;

@end

@implementation ZHHMediaScrollViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:UIScreen.mainScreen.bounds]) {
        self.reuseIdentifier = reuseIdentifier;
    }
    return self;
}

- (void)prepareForReuse {
    
}

@end
