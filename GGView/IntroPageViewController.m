//
//  PageViewController.m
//  GGView
//
//  Created by rainbowaffro on 2015/08/21.
//  Copyright (c) 2015年 rainbowaffro. All rights reserved.
//

#import "IntroPageViewController.h"
#import "QuestionViewController.h"

@interface IntroPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, Intro2ViewControllerDelegate>
@property (nonatomic, strong) NSArray *introViewControllers;
@end

@implementation IntroPageViewController {
//    NSArray *introViewControllers;
    QuestionViewController *questionViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    UIViewController *intro1 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro1"];
    Intro2ViewController *intro2 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro2"];
    Intro3ViewController *intro3 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro3"];
    UIViewController *intro4 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro4"];
    UIViewController *intro5 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro5"];
    UIViewController *intro6 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro6"];
    UIViewController *introLast = [self.storyboard instantiateViewControllerWithIdentifier:@"introLast"];
    intro2.delegate = self;

    
    self.introViewControllers = @[intro1, intro2, intro3, intro4, intro5, intro6, introLast];

    [self setViewControllers:@[intro1] direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor colorWithRed:253.0/255.0 green:234.8/255.0 blue:217.0/255.0 alpha:1.0];

       // Do any additional setup after loading the view.
}

//- (NSArray *)initViewControllers {
//    UIViewController *intro1 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro1"];
//    Intro2ViewController *intro2 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro2"];
//    Intro3ViewController *intro3 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro3"];
//    UIViewController *intro4 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro4"];
//    UIViewController *intro5 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro5"];
//    UIViewController *intro6 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro6"];
//    UIViewController *introLast = [self.storyboard instantiateViewControllerWithIdentifier:@"introLast"];
//    
//    return @[intro1, intro2, intro3, intro4, intro5, intro6, introLast];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger currentIndex = [self.introViewControllers indexOfObject:viewController];
    --currentIndex;
    if (currentIndex < 0)
    {
        return nil;
    }
    currentIndex = currentIndex % self.introViewControllers.count;
    return [self.introViewControllers objectAtIndex:currentIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController  viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger currentIndex = [self.introViewControllers indexOfObject:viewController];
    ++currentIndex;
    if (currentIndex >= [self.introViewControllers count]) {
        return nil;
    }
    currentIndex = currentIndex % self.introViewControllers.count;
    return [self.introViewControllers objectAtIndex:currentIndex];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.introViewControllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}


- (void)goNextPage {
    NSLog(@"goNextPage called");
    UIViewController *intro3 = [self.storyboard instantiateViewControllerWithIdentifier:@"intro3"];
    [self setViewControllers:@[intro3] direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];

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
