//
//  CMFocusCarouselController.h
//  CMFocusCarousel
//
//  Created by CMBaiDu on 15/6/18.
//  Copyright (c) 2015年 CMBaiDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMFocusImage.h"

@interface CMFocusCarouselController : UIPageViewController

@property (nonatomic, strong) NSArray *focusImages;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) NSInteger currentIndex;

@end
