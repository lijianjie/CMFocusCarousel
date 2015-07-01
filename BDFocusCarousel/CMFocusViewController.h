//
//  CMFocusViewController.h
//  CMFocusCarousel
//
//  Created by CMBaiDu on 15/6/18.
//  Copyright (c) 2015年 CMBaiDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMFocusImage.h"

@interface CMFocusViewController : UIViewController

@property (nonatomic, strong) CMFocusImage *focusImage;
@property (nonatomic, strong) UIImageView *focusImageView;

- (instancetype)initWithFocusImage:(CMFocusImage *)focusImage;

@end
