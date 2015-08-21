//
//  ResultPagViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/21.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "ResultPageViewController.h"
@interface ResultPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@end

@implementation ResultPageViewController {
    NSArray *resultViewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    UIViewController *result0 = [self.storyboard instantiateViewControllerWithIdentifier:@"result0"];
    UIViewController *result1 = [self.storyboard instantiateViewControllerWithIdentifier:@"result1"];
    UIViewController *result2 = [self.storyboard instantiateViewControllerWithIdentifier:@"result2"];
    UIViewController *result3 = [self.storyboard instantiateViewControllerWithIdentifier:@"result3"];
    UIViewController *result4 = [self.storyboard instantiateViewControllerWithIdentifier:@"result4"];
    
    resultViewControllers = @[result0, result1, result2, result3, result4];
    [self setViewControllers:@[result0] direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
    UIPageControl *pageControl = [UIPageControl appearance];
    NSLog(@"here");
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
    NSInteger currentIndex = [resultViewControllers indexOfObject:viewController];
    --currentIndex;
    if (currentIndex < 0)
    {
        return nil;
    }
    currentIndex = currentIndex % resultViewControllers.count;
    return [resultViewControllers objectAtIndex:currentIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController  viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger currentIndex = [resultViewControllers indexOfObject:viewController];
    ++currentIndex;
    if (currentIndex >= [resultViewControllers count]) {
        return nil;
    }
    currentIndex = currentIndex % resultViewControllers.count;
    return [resultViewControllers objectAtIndex:currentIndex];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [resultViewControllers count];
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
