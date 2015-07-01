//
//  CMFocusDataModel.h
//  CMFocusCarousel
//
//  Created by CMBaiDu on 15/6/18.
//  Copyright (c) 2015年 CMBaiDu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CMFocusImage : NSObject

@property (nonatomic, copy) NSString *focusImageStr;
@property (nonatomic, strong) UIImage *focusImage;
@property (nonatomic, assign) NSInteger focusIndex;

@end

@interface UIImageView (CMFocusImage)

- (void)setFocusImage:(CMFocusImage *)focusImage placehold:(UIImage *)placehold;

@end
