//
//  CMFocusDataModel.m
//  CMFocusCarousel
//
//  Created by CMBaiDu on 15/6/18.
//  Copyright (c) 2015年 CMBaiDu. All rights reserved.
//

#import "CMFocusImage.h"
//#import "UIImageView+WebCache.h"

@implementation CMFocusImage

@end

@implementation UIImageView (CMFocusImage)

- (void)setFocusImage:(CMFocusImage *)focusImage placehold:(UIImage *)placehold
{
    if (focusImage.focusImage) {
        [self setImage:focusImage.focusImage];
    } else if (focusImage.focusImageStr && [focusImage.focusImageStr length] > 0){
//        [self setImageWithURL:[NSURL URLWithString:focusImage.focusImageStr]
//             placeholderImage:placehold
//                      options:0
//                      success:^(UIImage *image, BOOL cached) {
//                          
//                          focusImage.focusImage = image;
//                      } failure:NULL];
    }
}

@end
