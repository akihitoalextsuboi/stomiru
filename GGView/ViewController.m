//
//  ViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/19.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "ViewController.h"
#import "GGView.h"
@interface ViewController ()

@end

@implementation ViewController

//- (void)loadView {
//   // self.view = [[GGView alloc] init];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.questions = [[NSArray alloc] initWithObjects:@"first",
                      @"second",
                      @"third",
                      @"fourth",
                      nil];
    self.answeredCards = [[NSMutableArray alloc] init];
    self.allCards = [[NSMutableArray alloc] init];
    [self loadCards];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                [self.view insertSubview:[self.answeredCards objectAtIndex:i]
                       belowSubview:[self.answeredCards objectAtIndex:i - 1]];
            } else {
                [self.view
                 addSubview:[self.answeredCards objectAtIndex:i]];
            }
        }
        
    }
}

@end
