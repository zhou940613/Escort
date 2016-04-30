//
//  BYDefined.h
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SETTINGs [NSUserDefaults standardUserDefaults]
#define APPLICATION_SETTING [UIApplication sharedApplication]

#define BYSD_SETIMG_NAME(imageName) sd_setImageWithURL:[NSURL URLWithString:imageName]

// Default Color
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:(((float)r) / 255.0) green:(((float)g) / 255.0) blue:(((float)b) / 255.0) alpha:1.0]

#define UIColorFromHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

#define WhiteBackGroudColor [UIColor whiteColor]
#define RedBackGroundColor [UIColor redColor]


//
#define IMAGE(IMAGE_NAME)  [UIImage imageNamed:IMAGE_NAME]

// Font Settings
#define FONT_REGULAR(SIZE)      [UIFont systemFontOfSize:SIZE]
#define FONT_LIGHT(SIZE)        [UIFont fontWithName:@"Lato-Light" size:SIZE]
#define FONT_BOLD(SIZE)         [UIFont boldSystemFontOfSize:SIZE]
#define FONT_ITALIC(SIZE)       [UIFont fontWithName:@"Lato-Italic" size:SIZE]

// Check IPhone and OS Version
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

// Screen Size Settings
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

// PlaceHolder Settings
#define BYPLACEHOLDER1   [UIImage imageNamed:@"placeholder1.png"]
#define BYPLACEHOLDER2   [UIImage imageNamed:@"placeholder2.png"]
#define BYPLACEHOLDER3   [UIImage imageNamed:@"placeholder3.png"]


// URL
#define HOME_DATESOURCE_1   [NSString stringWithFormat:@"http://api.breadtrip.com/v2/index/"]
#define HOME_DATESOURCE_2   [NSString stringWithFormat:@"http://api.breadtrip.com/v2/new_trip/spot/hot/list/?start=0"]
#define HOME_DATESOURCE_3   [NSString stringWithFormat:@"http://open.qyer.com/qyer/recommands/trip?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=865813022299481&track_app_version=6.8.1&track_app_channel=xiaomi&track_device_info=lcsh92_wet_tdd&track_os=Android4.2.2&app_installtime=1445319780896&lat=38.883593&lon=121.544474&type=index&page=1&count=10"]
#define HOTEL_URL   [NSString stringWithFormat:@"http://open.qyer.com/qyer/hotel/hot_city_list?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=865813022299481&track_app_version=6.8.1&track_app_channel=xiaomi&track_device_info=lcsh92_wet_tdd&track_os=Android4.2.2&app_installtime=1445319780896&lat=38.883651&lon=121.544459&count=9"];
#define SIGHT_URL   [NSString stringWithFormat:@"http://m.tuniu.com/appHtml/ticketChannel/index/cityLetter/d"];
#define VISA_URL    [NSString stringWithFormat:@"http://m.tuniu.com/dl/visa"];
#define STOCK_URL   [NSString stringWithFormat:@"http://8.m.tuniu.com/msite/m"];








