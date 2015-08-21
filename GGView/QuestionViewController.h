//
//  ViewController.h
//  GGView
//
//  Created by rainbowaffro on 2015/08/19.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGDraggableView.h"
@interface QuestionViewController : UIViewController

@property (nonatomic) NSArray *questions;
@property (nonatomic) NSMutableArray *answeredCards;
@property (nonatomic) NSMutableArray *allCards;
@end

