//
//  BYCustomTools.h
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BYCustomTools : NSObject
/**
 *  prevent the upward drift of ViewController
 */
+ (void)disableExtendedViewController:(UIViewController *)viewController;

/**
 *  stretch a image from center and return this stretched image
 *
 *  @param image Input image
 *
 *  @return stretched image
 */
+ (UIImage *)stretchImageFromCenter:(UIImage *)image;


@end
