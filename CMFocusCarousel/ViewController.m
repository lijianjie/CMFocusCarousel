//
//  ViewController.m
//  CMTest
//
//  Created by CMBaiDu on 15/6/18.
//  Copyright (c) 2015年 CMBaiDu. All rights reserved.
//

#import "ViewController.h"
#import "CMFocusCarouselController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addFocusCarousel];
}

- (void)addFocusCarousel
{
    NSDictionary *options = @{ UIPageViewControllerOptionInterPageSpacingKey: @(10) };
    CMFocusCarouselController *focusCarousel = [[CMFocusCarouselController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                                                    navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                                                  options:options];
    CMFocusImage *AlexOnWater = [[CMFocusImage alloc] init];
    AlexOnWater.focusImage = [UIImage imageNamed:@"AlexOnWater.jpg"];
    AlexOnWater.focusIndex = 0;
    
    CMFocusImage *Headwaters = [[CMFocusImage alloc] init];
    Headwaters.focusImage = [UIImage imageNamed:@"Headwaters.jpg"];
    Headwaters.focusIndex = 1;
    
    CMFocusImage *UpperLake = [[CMFocusImage alloc] init];
    UpperLake.focusImage = [UIImage imageNamed:@"UpperLake.jpg"];
    UpperLake.focusIndex = 2;
    
    CMFocusImage *CampSpot = [[CMFocusImage alloc] init];
    CampSpot.focusImage = [UIImage imageNamed:@"CampSpot.jpg"];
    CampSpot.focusIndex = 3;
    
    CMFocusImage *LakeSide = [[CMFocusImage alloc] init];
    LakeSide.focusImage = [UIImage imageNamed:@"LakeSide.jpg"];
    LakeSide.focusIndex = 4;
    
    CMFocusImage *RockPenninsula = [[CMFocusImage alloc] init];
    RockPenninsula.focusImage = [UIImage imageNamed:@"RockPenninsula.jpg"];
    RockPenninsula.focusIndex = 5;
    
    focusCarousel.focusImages = @[AlexOnWater, Headwaters, UpperLake, CampSpot, LakeSide, RockPenninsula];
    
    [self addChildViewController:focusCarousel];
    [self.view addSubview:focusCarousel.view];
    [focusCarousel didMoveToParentViewController:self];
    
    focusCarousel.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
