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
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
- (void)cardSwiped:(UIView *)card;
@end

@implementation QuestionViewController {
    NSInteger loadedCardsIndex;
    NSInteger swipedCardsIndex;
}

//- (void)loadView {
//   // self.view = [[GGView alloc] init];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:253.0/255.0 green:234.8/255.0 blue:217.0/255.0 alpha:1.0];
    NSDictionary *dict1 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"非常にたくさんの仕事をしなければならないですか？"};
    NSDictionary *dict2 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"時間内に仕事が処理しきれない"};
    NSDictionary *dict3 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"一生懸命働かなければならない"};
    NSDictionary *dict4 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"かなり注意を集中する必要がある"};
    NSDictionary *dict5 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"高度の知識や技術が必要なむずかしい仕事だ"};
    NSDictionary *dict6 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"勤務時間中はいつも仕事のことを考えていなければならない"};
    NSDictionary *dict7 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"からだを大変よく使う仕事だ"};
    NSDictionary *dict8 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"自分のペースで仕事ができる"};
    NSDictionary *dict9 = @{@"title":@"あなたの仕事についてうかがいます。", @"question":@"自分で仕事の順番・やり方を決めることができる"};
//    10. 職場の仕事の方針に自分の意見を反映できる
//    11. 自分の技能や知識を仕事で使うことが少ない
//    12. 私の部署内で意見のくい違いがある
//    13. 私の部署と他の部署とはうまが合わない
//    14. 私の職場の雰囲気は友好的である
//    15. 私の職場の作業環境（騒音、照明、温度、換気など）はよくない
//    16. 仕事の内容は自分にあっている
//    17. 働きがいのある仕事だ
//    
//    Ｂ 最近 1 か月間のあなたの状態についてうかがいます
//    （１．ほとんどなかった　２．時々あった　3．しばしばあった　４．いつもあった）
//    1. 活気がわいてくる
//    2. 元気がいっぱいだ
//    3. 生き生きする
//    4. 怒りを感じる
//    5. 内心腹立たしい
//    6. イライラしている
//    7. ひどく疲れた
//    8. へとへとだ
//    9. だるい
//    10. 気がはりつめている
//    11. 不安だ
//    12. 落着かない
//    13. ゆううつだ
//    14. 何をするのも面倒だ
//    15. 物事に集中できない
//    16. 気分が晴れない
//    17. 仕事が手につかない
//    18. 悲しいと感じる
//    19. めまいがする
//    20. 体のふしぶしが痛む
//    21. 頭が重かったり頭痛がする
//    22. 首筋や肩がこる
//    23. 腰が痛い
//    24. 目が疲れる
//    25. 動悸や息切れがする
//    26. 胃腸の具合が悪い
//    27. 食欲がない
//    28. 便秘や下痢をする
//    29. よく眠れない
//    Ｃ あなたの周りの方々についてうかがいます。最もあてはまるものに○を付けてください。次の人たちはどのくらい気軽に話ができますか？
//    （１．非常に　2．かなり　３．多少　４．全くない）
//    1. 上司
//    2. 職場の同僚
//    3. 配偶者、家族、友人等
//    あなたが困った時、次の人たちはどのくらい頼りになりますか？
//    4. 上司
//    5. 職場の同僚
//    6. 配偶者、家族、友人等
//    あなたの個人的な問題を相談したら、次の人たちはどのくらいきいてくれますか？ 
//    7. 上司 
//    8. 職場の同僚
//    9. 配偶者、家族、友人等
//    Ｄ 満足度について
//    1. 仕事に満足だ
//    2. 家庭生活に満足だ
//    
    
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
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            DraggableView *draggableView = [[DraggableView alloc] initWithFrame:CGRectMake(20, 60, screenRect.size.width - 20 * 2, screenRect.size.height - 290)];
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
    swipedCardsIndex++;
    NSString *str1 = @"STEP(1)";
    NSString *str2 = [str1 stringByAppendingFormat:@" %d/17問 全", swipedCardsIndex + 1];
    NSString *str3 = [str2 stringByAppendingFormat:@"%d/53問", swipedCardsIndex + 1];
    NSString *labelText = str3;
    self.countLabel.text = labelText;
}
@end
