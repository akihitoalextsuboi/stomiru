//
//  Intro6ViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/21.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "IntroLastViewController.h"
#import "QuestionViewController.h"

@interface IntroLastViewController ()

@end

@implementation IntroLastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)startButton:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    QuestionViewController *questionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"questionViewController"];
    [self presentViewController:questionViewController animated:YES completion:nil];
}

@end
