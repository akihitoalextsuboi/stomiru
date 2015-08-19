//
//  GGView.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/19.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "GGView.h"
#import "GGDraggableView.h"

@interface GGView ()

@end

@implementation GGView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.backgroundColor = [UIColor redColor];
    self.questions = [[NSArray alloc] initWithObjects:@"first",
                      @"second",
                      @"third",
                      @"fourth",
                      nil];
    self.answeredCards = [[NSMutableArray alloc] init];
    self.allCards = [[NSMutableArray alloc] init];
    [self loadCards];
//    [self loadDraggableCustomView];
    
    return self;
}

- (void)loadCards {
    NSInteger count = [self.questions count];
    if ( count > 0 ) {
        NSInteger cardsToLoad = count > 4 ? 4 : count;
        for (int i = 0; i < count; i++) {
            GGDraggableView *ggdraggableView = [[GGDraggableView alloc] initWithFrame:CGRectMake(60, 60, 200, 260)];
            ggdraggableView.information.text = [self.questions objectAtIndex:i];
            [self.allCards addObject:ggdraggableView];
            if ( i < cardsToLoad) {
                [self.answeredCards addObject:ggdraggableView];
            }
        }
        for (int i = 0; i < [self.answeredCards count]; i++) {
            if (i > 0) {
                [self insertSubview:[self.answeredCards objectAtIndex:i]
                       belowSubview:[self.answeredCards objectAtIndex:i - 1]];
            } else {
                [self addSubview:[self.answeredCards objectAtIndex:i]];
            }
        }

    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
