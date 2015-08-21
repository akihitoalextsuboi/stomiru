//
//  ViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/19.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "QuestionViewController.h"
#import "DraggableView.h"
#import "ResultPageViewController.h"

@interface QuestionViewController () <DraggableViewDelegate>
- (void)cardSwiped:(UIView *)card;
@end

@implementation QuestionViewController {
    NSInteger loadedCardsIndex;
}

//- (void)loadView {
//   // self.view = [[GGView alloc] init];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.8 blue:0.5 alpha:1.0];
    NSDictionary *dict1 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"非常にたくさんの仕事をしなければならないですか？"};
    NSDictionary *dict2 = @{@"title":@"xxx", @"question":@"sss"};
    NSDictionary *dict3 = @{@"title":@"xxx", @"question":@"sss"};
    NSDictionary *dict4 = @{@"title":@"xxx", @"question":@"sss"};
    NSDictionary *dict5 = @{@"title":@"xxx", @"question":@"sss"};
    NSDictionary *dict6 = @{@"title":@"xxx", @"question":@"sss"};
    NSDictionary *dict7 = @{@"title":@"xxx", @"question":@"sss"};
    self.questions = [[NSArray alloc] initWithObjects: dict1, dict2, dict3, dict4, dict5, dict6, dict7, nil];
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
            DraggableView *draggableView = [[DraggableView alloc] initWithFrame:CGRectMake(20, 60, 280, 320)];
            draggableView.title.text = [self.questions objectAtIndex:i][@"title"];
            draggableView.question.text = [self.questions objectAtIndex:i][@"question"];
            draggableView.delegate = self;
            [self.allCards addObject:draggableView];
            if ( i < cardsToLoad) {
                [self.answeredCards addObject:draggableView];
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
            loadedCardsIndex++;
        }
        
    }
}

- (void)cardSwiped:(UIView *)card {
    [self.answeredCards removeObjectAtIndex:0];
    if (loadedCardsIndex < self.allCards.count) {
        [self.answeredCards addObject:[self.allCards objectAtIndex:loadedCardsIndex]];
        loadedCardsIndex++;
        [self.view insertSubview:[self.answeredCards objectAtIndex:(4 - 1)] belowSubview:[self.answeredCards objectAtIndex:(4 - 2)]];
    }
    if (self.answeredCards.count == 0) {
        ResultPageViewController *resultPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"resultPageViewController"];
        [self presentViewController:resultPageViewController animated:NO completion:nil];
    }
   
}
@end
