//
//  BYCustomTools.m
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYCustomTools.h"

@implementation BYCustomTools

+ (void)disableExtendedViewController:(UIViewController *)viewController{
    
    if ([viewController respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [viewController setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

+ (UIImage *)stretchImageFromCenter:(UIImage *)image{
    
    if (image) {
        CGFloat capWidth = floorf(image.size.width / 2);
        CGFloat capHeight = floorf(image.size.height / 2);
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(capHeight, capWidth, capHeight, capWidth)];
    }
    return image;
}

@end
