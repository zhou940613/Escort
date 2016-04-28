//
//  BYCustomTools.m
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYCustomTools.h"

@implementation BYCustomTools

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

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

+ (BOOL)isNullObject:(id)object{
    
    if (!object || [object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isEmptyString:(NSString *)string{
    
    if ([[self class] isNullObject:string]) {
        return YES;
    }
    else if (![string isKindOfClass:[NSString class]]){
        return YES;
    }
    else if ([string isEqualToString:@""]){
        return YES;
    }
    
    return NO;
}

+ (NSString *)returnSafeString:(NSString *)string{
    
    if ([[self class] isEmptyString:string]) {
        return @"";
    }
    else
        return string;
}

+ (void)AFGetDateWithMethodGet_BaseOnURL:(NSString *)url dateBlock:(NetworkDate)dateBlock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/json", @"application/json", @"text/javascript", @"text/html",  nil];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       
        dateBlock(responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        NSLog(@"ERROR : %@", error);
    }];
}

+ (void)judgeTheStatusOfCurrentNetwork_statusBlock:(NetworkStatus)statusBlock{
    
    AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];
    
    [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /*
         AFNetworkReachabilityStatusUnknown          = -1,
         AFNetworkReachabilityStatusNotReachable     = 0,
         AFNetworkReachabilityStatusReachableViaWWAN = 1,
         AFNetworkReachabilityStatusReachableViaWiFi = 2,
         */
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                NSLog(@"未知");
//                break;
//            case AFNetworkReachabilityStatusNotReachable:
//                NSLog(@"没有网络");
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                NSLog(@"3G|4G");
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                NSLog(@"WiFi");
//                break;
//            default:
//                break;
//        }
        
        
        
    }];
    
}

// 有待测试
+ (AFNetworkReachabilityStatus)backWithCurrentStatus{
    
    __block AFNetworkReachabilityStatus status1 = AFNetworkReachabilityStatusUnknown;
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        status1 = status;
    }];
    
    NSLog(@"%ld", (long)status1);
    
    return status1;
}

@end
