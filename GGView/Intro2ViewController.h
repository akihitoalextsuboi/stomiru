//
//  Intro2ViewController.h
//  GGView
//
//  Created by rainbowaffro on 2015/08/21.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Intro2ViewControllerDelegate <NSObject>

- (void)goNextPage;

@end

@interface Intro2ViewController : UIViewController
@property (nonatomic, retain) id<Intro2ViewControllerDelegate> delegate;
@end
