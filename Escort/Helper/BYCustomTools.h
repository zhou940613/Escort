//
//  BYCustomTools.h
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking.h>

typedef void(^NetworkDate)(id dateBlock);
typedef void(^NetworkStatus)(id statusBlock);

@interface BYCustomTools : NSObject

@property(nonatomic, strong) AFHTTPRequestOperationManager *manager;

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

/**
 *  varify object not null
 *
 *  @param object object to varify
 *
 *  @return varified object
 */
+ (BOOL)isNullObject:(id)object;

/**
 *  varify stirng not empty
 *
 *  @param string string to varify
 *
 *  @return varified string
 */
+ (BOOL)isEmptyString:(NSString *)string;

/**
 *  get safe string
 *
 *  @param string original string
 *
 *  @return safe string
 */
+ (NSString *)returnSafeString:(NSString *)string;

/**
 *  AFNetworking get date
 *
 *  @param url server url
 *
 *  @return date in server
 */
+ (void)AFGetDateWithMethodGet_BaseOnURL:(NSString *)url dateBlock:(NetworkDate)dateBlock;

/**
 *  judge current network status
 *
 *  @return current network status description
 */
+ (void)judgeTheStatusOfCurrentNetwork_statusBlock:(NetworkStatus)statusBlock;

+ (AFNetworkReachabilityStatus)backWithCurrentStatus;

@end
