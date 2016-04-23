//
//  AppDelegate.m
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//
#import "BYDefined.h"
#import "BYCustomTools.h"

#import "AppDelegate.h"
#import "BYSplashViewController.h"
#import "BYMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // set status bar
    [APPLICATION_SETTING setStatusBarStyle:UIStatusBarStyleDefault];
    [APPLICATION_SETTING setStatusBarHidden:NO];
    
    // set navigationBar
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:UIColorFromHex(0x737373),
                                 NSFontAttributeName:FONT_REGULAR(17.0),
                                 NSShadowAttributeName:shadow,
                                 };
    UIImage *backgroundImage = IMAGE(@"navigation3.png");
    backgroundImage = [BYCustomTools stretchImageFromCenter:backgroundImage];
    
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    [[UINavigationBar appearance] setTintColor:WhiteBackGroudColor];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UINavigationBar appearance] setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    

    // show splash screen as default while app authentication with server
    [self showSplashViewController];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", path);
    
    return YES;
}

- (void)showSplashViewController{
    
    BYSplashViewController *splashVC = [[BYSplashViewController alloc] init];
    self.window.rootViewController = splashVC;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = WhiteBackGroudColor;
    
    
    
    [self performSelector:@selector(showMainViewController) withObject:nil afterDelay:3.0];
}

- (void)showMainViewController{
    
    BYMainViewController *mainVC = [[BYMainViewController alloc] init];
    self.window  .rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = WhiteBackGroudColor;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
