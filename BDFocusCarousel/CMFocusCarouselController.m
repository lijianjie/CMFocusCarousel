//
//  CMFocusCarouselController.m
//  CMFocusCarousel
//
//  Created by CMBaiDu on 15/6/18.
//  Copyright (c) 2015年 CMBaiDu. All rights reserved.
//

#import "CMFocusCarouselController.h"
#import "CMFocusViewController.h"

@interface CMFocusCarouselController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, weak) NSTimer *autoRollTime;
@property (nonatomic, weak) UIPageControl *pageContol;

@end

@implementation CMFocusCarouselController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = self;
    self.delegate = self;
    self.pageCount = self.focusImages.count;
    
    CGFloat viewHeight = self.view.bounds.size.height;
    CGFloat viewWidth = self.view.bounds.size.width;
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, viewHeight-20, viewWidth, 20)];
    pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    pageControl.numberOfPages = self.pageCount;
    pageControl.pageIndicatorTintColor = [UIColor greenColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:pageControl];
    self.pageContol = pageControl;
    
    CMFocusViewController *currentFocus = [self focusViewControllerWithIndex:self.currentIndex];
    [self setViewControllers:@[currentFocus] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    // KVO
    [self addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self schedulePeriodicTask];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.autoRollTime invalidate];
    
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self removeObserver:self.pageContol forKeyPath:@"currentIndex"];
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentIndex"])
    {
        [self.pageContol setCurrentPage:self.currentIndex];
    }
}

#pragma mark - Utility Methods
- (CMFocusViewController *)focusViewControllerWithIndex:(NSInteger)index
{
    CMFocusImage *focusImage = [self.focusImages objectAtIndex:index];
    return [[CMFocusViewController alloc] initWithFocusImage:focusImage];
}

- (void)schedulePeriodicTask
{
    self.autoRollTime = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                                         target:self
                                                       selector:@selector(autoMoveToNextPage:)
                                                       userInfo:nil
                                                        repeats:YES];
}

- (void)autoMoveToNextPage:(NSTimer *)timer
{
    self.currentIndex = (self.currentIndex + 1) % self.pageCount;;
    CMFocusViewController *currentFocus = [self focusViewControllerWithIndex:self.currentIndex];
    [self setViewControllers:@[currentFocus] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController;
{
    NSInteger beforeIndex = (self.currentIndex + self.pageCount - 1) % self.pageCount;
    return [self focusViewControllerWithIndex:beforeIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger afterIndex = (self.currentIndex + 1) % self.pageCount;
    return [self focusViewControllerWithIndex:afterIndex];
}

#pragma mark - UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (completed) {
        CMFocusViewController *currentFocusViewController = [self.viewControllers firstObject];
        self.currentIndex = currentFocusViewController.focusImage.focusIndex;
    }
}

@end
