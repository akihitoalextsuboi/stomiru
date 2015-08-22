//
//  OverlayView.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/22.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView
@synthesize imageView;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"souda"]];
        [self addSubview:imageView];
    }
    return self;
}

- (void)setMode:(GGOverlayViewMode)mode {
    if (_mode == mode) {
        return;
    }
    _mode = mode;
    if (mode == GGOverlayViewModeTop) {
        imageView.image = [UIImage imageNamed:@"souda"];
    } else if (mode == GGOverlayViewModeRight) {
        imageView.image = [UIImage imageNamed:@"maasouda"];
    } else if (mode == GGOverlayViewModeBottom) {
        imageView.image = [UIImage imageNamed:@"yayachigau"];
    } else if (mode == GGOverlayViewModeLeft) {
        imageView.image = [UIImage imageNamed:@"chigau"];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    imageView.frame = CGRectMake(50, 50, 100,100);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
