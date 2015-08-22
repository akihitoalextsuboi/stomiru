//
//  OverlayView.h
//  GGView
//
//  Created by rainbowaffro on 2015/08/22.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GGOverlayViewMode) {
    GGOverlayViewModeTop,
    GGOverlayViewModeRight,
    GGOverlayViewModeBottom,
    GGOverlayViewModeLeft
};
@interface OverlayView : UIView
@property (nonatomic) GGOverlayViewMode mode;
@property (nonatomic, strong) UIImageView *imageView;

@end
