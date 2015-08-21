//
//  PageViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/21.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@end

@implementation PageViewController {
    NSArray *introViewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    UIViewController *intro1 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro1"];
    UIViewController *intro2 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro2"];
    UIViewController *intro3 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro3"];
    introViewControllers = @[intro1, intro2, intro3];
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
    if (currentIndex > [introViewControllers count]) {
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
