//
//  Intro2ViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/21.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "Intro2ViewController.h"

@interface Intro2ViewController ()

@end

@implementation Intro2ViewController
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ストミル"
                                                        message:@"ストミルは、あなたにプッシュ通知をします。よろしいでしょうか？"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goNext:(id)sender {
    [self.delegate goNextPage];
}

    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
