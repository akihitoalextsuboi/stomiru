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
    NSDictionary *dict2 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"時間内に仕事が処理しきれない"};
    NSDictionary *dict3 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"一生懸命働かなければならない"};
    NSDictionary *dict4 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"かなり注意を集中する必要がある"};
    NSDictionary *dict5 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"高度の知識や技術が必要なむずかしい仕事だ"};
    NSDictionary *dict6 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"勤務時間中はいつも仕事のことを考えていなければならない"};
    NSDictionary *dict7 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"からだを大変よく使う仕事だ"};
    NSDictionary *dict8 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"自分のペースで仕事ができる"};
    NSDictionary *dict9 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"自分で仕事の順番・やり方を決めることができる"};
    
    
    self.questions = [[NSArray alloc] initWithObjects: dict1, dict2, dict3, dict4, dict5, dict6, dict7, dict8, dict9, nil];
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
