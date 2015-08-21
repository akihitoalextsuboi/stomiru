//
//  ViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/19.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

//- (void)loadView {
//   // self.view = [[GGView alloc] init];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.58 blue:0.35 alpha:1.0];
    NSDictionary *dict1 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"非常にたくさんの仕事をしなければならないですか？"};
    NSDictionary *dict2 = @{@"title":@"xxx", @"question":@"sss"};
    self.questions = [[NSArray alloc] initWithObjects: dict1, dict2, nil];
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
            GGDraggableView *ggdraggableView = [[GGDraggableView alloc] initWithFrame:CGRectMake(20, 60, 280, 260)];
            ggdraggableView.title.text = [self.questions objectAtIndex:i][@"title"];
            ggdraggableView.question.text = [self.questions objectAtIndex:i][@"question"];
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
