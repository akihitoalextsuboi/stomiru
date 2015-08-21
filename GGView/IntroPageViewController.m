//
//  PageViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/21.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "IntroPageViewController.h"
#import "QuestionViewController.h"

@interface IntroPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@end

@implementation IntroPageViewController {
    NSArray *introViewControllers;
    QuestionViewController *questionViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    UIViewController *intro1 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro1"];
    UIViewController *intro2 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro2"];
    UIViewController *intro3 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro3"];
    UIViewController *intro4 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro4"];
    UIViewController *intro5 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro5"];
    UIViewController *intro6 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro6"];

    introViewControllers = @[intro1, intro2, intro3, intro4, intro5, intro6];
    [self setViewControllers:@[intro1] direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger currentIndex = [introViewControllers indexOfObject:viewController];
    --currentIndex;
    if (currentIndex < 0)
    {
        return nil;
    }
    currentIndex = currentIndex % introViewControllers.count;
    return [introViewControllers objectAtIndex:currentIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController  viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger currentIndex = [introViewControllers indexOfObject:viewController];
    ++currentIndex;
    if (currentIndex >= [introViewControllers count]) {
        return nil;
    }
    currentIndex = currentIndex % introViewControllers.count;
    return [introViewControllers objectAtIndex:currentIndex];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [introViewControllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
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
