//
//  GGDraggableView.h
//  GGView
//
//  Created by rainbowaffro on 2015/08/19.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "OverlayView.h"
@protocol DraggableViewDelegate <NSObject>
- (void)cardSwiped:(UIView *)card;

@end
@interface DraggableView : UIView
@property (weak) id <DraggableViewDelegate> delegate;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *question;
@property (nonatomic, strong) OverlayView *overlayView;
@end
