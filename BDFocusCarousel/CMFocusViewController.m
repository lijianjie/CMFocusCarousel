//
//  CMFocusViewController.m
//  CMFocusCarousel
//
//  Created by CMBaiDu on 15/6/18.
//  Copyright (c) 2015年 CMBaiDu. All rights reserved.
//

#import "CMFocusViewController.h"

@interface CMFocusViewController ()

@end

@implementation CMFocusViewController

- (instancetype)initWithFocusImage:(CMFocusImage *)focusImage
{
    self = [super init];
    if (self) {
        _focusImage = focusImage;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.focusImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.focusImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.focusImageView setFocusImage:self.focusImage placehold:nil];
    [self.view addSubview:self.focusImageView];
    
    UILabel *indexLabel = [[UILabel alloc] init];
    indexLabel.text = [NSString stringWithFormat:@"%ld", (long)self.focusImage.focusIndex];
    indexLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [indexLabel sizeToFit];
    indexLabel.textColor = [UIColor redColor];
    indexLabel.center = self.focusImageView.center;
    indexLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:indexLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
