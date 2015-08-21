//
//  GGDraggableView.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/19.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "DraggableView.h"

@interface DraggableView ()
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic) CGPoint originalPoint;
@property (nonatomic) CGFloat xDistance;
@property (nonatomic) CGFloat yDistance;

@end

@implementation DraggableView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    [self setupView];
    self.backgroundColor = [UIColor whiteColor];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, 50)];
    self.title.text = @"no info";
    [self.title setTextAlignment:NSTextAlignmentCenter];
    self.title.textColor = [UIColor redColor];
    self.title.numberOfLines = 0;
    [self addSubview:self.title];
    
    self.question = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, self.frame.size.width, 100)];
    self.question.text = @"no info";
    [self.question setTextAlignment:NSTextAlignmentCenter];
    self.question.textColor = [UIColor blackColor];
    self.question.numberOfLines = 0;
    [self addSubview:self.question];
    
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragged:)];
    [self addGestureRecognizer:self.panGestureRecognizer];
    //[self loadImageAndStyle];
    
    return self;
}

- (void)loadImageAndStyle {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar"]];
    
    imageView.frame = CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y, 260, 260);
    
    [self addSubview:imageView];
    self.layer.cornerRadius = 20;
    self.layer.shadowOffset = CGSizeMake(7, 7);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
}
- (void)setupView {
    self.layer.cornerRadius = 20;
    self.layer.shadowOffset = CGSizeMake(3, 3);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.2;
}

- (void)dragged:(UIPanGestureRecognizer *)gestureRecognizer {
    self.xDistance = [gestureRecognizer translationInView:self].x;
    self.yDistance = [gestureRecognizer translationInView:self].y;
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            self.originalPoint = self.center;
            break;
        };
        case UIGestureRecognizerStateChanged: {
            CGFloat rotationStrength = MIN(self.xDistance / 320, 1);
            CGFloat rotationAngel = (CGFloat) (2*M_PI/16 * rotationStrength);
            CGFloat scaleStrength = 1 - fabsf(rotationStrength) / 4;
            CGFloat scale = MAX(scaleStrength, 0.93);
            CGAffineTransform transform = CGAffineTransformMakeRotation(rotationAngel);
            CGAffineTransform scaleTransform = CGAffineTransformScale(transform, scale, scale);
            self.transform = scaleTransform;
            self.center = CGPointMake(self.originalPoint.x + self.xDistance, self.originalPoint.y + self.yDistance);

            break;
        };
        case UIGestureRecognizerStateEnded: {
            if (self.xDistance > 120) {
                NSLog(@"RightSwipeAction");
                [self swipeOutToRight];
                [delegate cardSwiped:self];
            } else if (self.xDistance < -120) {
                NSLog(@"LeftSwipeAction");
                [self swipeOutToLeft];
                [delegate cardSwiped:self];
            } else if (self.yDistance > 120) {
                NSLog(@"bottomSwipeAction");
                [self swipeOutToBottom];
                [delegate cardSwiped:self];
            } else if (self.yDistance < -120) {
                NSLog(@"topSwipeAction");
                [self swipeOutToTop];
                [delegate cardSwiped:self];
            } else {
                [self resetViewPositionAndTransformations];
            }
            break;
        };
    }
    
}

- (void)resetViewPositionAndTransformations {
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.center = self.originalPoint;
                         self.transform = CGAffineTransformMakeRotation(0);
                     }];
}

- (void)swipeOutToRight {
    CGPoint finishPoint = CGPointMake(500, 2 * self.yDistance + self.originalPoint.y);
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.center = finishPoint;
                     } completion:^(BOOL complete) {
                         [self removeFromSuperview];
                     }];
}
- (void)swipeOutToLeft {
    CGPoint finishPoint = CGPointMake(-500, 2 * self.yDistance + self.originalPoint.y);
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.center = finishPoint;
                     } completion:^(BOOL complete) {
                         [self removeFromSuperview];
                     }];
}

- (void)swipeOutToBottom {
    CGPoint finishPoint = CGPointMake(160, 2 * self.yDistance);
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.center = finishPoint;
                     } completion:^(BOOL complete) {
                         [self removeFromSuperview];
                     }];
}

- (void)swipeOutToTop {
    CGPoint finishPoint = CGPointMake(160, 2 * self.yDistance);
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.center = finishPoint;
                     } completion:^(BOOL complete) {
                         [self removeFromSuperview];
                     }];
}

- (void)dealloc {
    [self removeGestureRecognizer:self.panGestureRecognizer];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
