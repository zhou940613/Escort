//
//  BYMainViewController.m
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYMainViewController.h"
#import "BYDefined.h"
#import "BYCustomNavigation.h"

#import "BYHomeViewController.h"
#import "BYSpecialViewController.h"
#import "BYFindViewController.h"
#import "BYFavouredTourViewController.h"
#import "BYMySettingsViewController.h"


@interface BYMainViewController ()<UITabBarControllerDelegate>

@end

@implementation BYMainViewController

#pragma mark -- Screen Rotate Management
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
-(BOOL)shouldAutorotate
{
    return YES;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

#pragma mark -- Image Render
- (UIImage *)makeOriginalImage:(NSString *)imageName{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // create tabBarItem
    BYHomeViewController *homeVC = [[BYHomeViewController alloc] init];
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:[self makeOriginalImage:@"Tab_home_new.png"] selectedImage:[self makeOriginalImage:@"Tab_home.png"]];
    
    BYSpecialViewController *specialVC = [[BYSpecialViewController alloc] init];
    specialVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"专题" image:[self makeOriginalImage:@"Tab_Special_new.png"] selectedImage:[self makeOriginalImage:@"Tab_Special.png"]];
    
    BYFindViewController *findVC = [[BYFindViewController alloc] init];
    findVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[self makeOriginalImage:@"Tab_Find_new.png"] selectedImage:[self makeOriginalImage:@"Tab_Find.png"]];
    
    BYFavouredTourViewController *favourVC = [[BYFavouredTourViewController alloc] init];
    favourVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"惠游" image:[self makeOriginalImage:@"Tab_Favour_new.png"] selectedImage:[self makeOriginalImage:@"Tab_Favour.png"]];
    
    BYMySettingsViewController *mySettingVC = [[BYMySettingsViewController alloc] init];
    mySettingVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[self makeOriginalImage:@"Tab_setting_new.png"] selectedImage:[self makeOriginalImage:@"Tab_setting.png"]];
    
    // align center
    homeVC.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    specialVC.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    findVC.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    favourVC.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    mySettingVC.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // navigation
    BYCustomNavigation *homeNavi = [[BYCustomNavigation alloc] initWithRootViewController:homeVC];
    BYCustomNavigation *specialNavi = [[BYCustomNavigation alloc] initWithRootViewController:specialVC];
    BYCustomNavigation *findNavi = [[BYCustomNavigation alloc] initWithRootViewController:findVC];
    BYCustomNavigation *favourNavi = [[BYCustomNavigation alloc] initWithRootViewController:favourVC];
    BYCustomNavigation *mySettingNavi = [[BYCustomNavigation alloc] initWithRootViewController:mySettingVC];
    
    NSArray *tabs = @[homeNavi, specialNavi, findNavi, favourNavi, mySettingNavi];
    self.viewControllers = [tabs copy];
    
    // tabBar
    self.tabBar.backgroundColor = WhiteBackGroudColor;
    self.tabBar.translucent = YES;
    self.tabBar.tintColor = UIColorFromHex(0x40aefe);
    self.tabBar.shadowImage = [[UIImage alloc] init];
    [self setDelegate:self];
    
    // add shadow up for footer
    CGRect rect = CGRectMake(0, -11, CGRectGetWidth(self.tabBar.frame), 11);
    UIImageView *footShadow = [[UIImageView alloc] initWithFrame:rect];
    footShadow.image = IMAGE(@"footer_top.png");
    [self.tabBar addSubview:footShadow];
    
}

#pragma mark -- Override TabBarController Method
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
//    NSInteger index = [self.viewControllers indexOfObject:viewController];
    
    // 限制各个tabBar的访问权限 （增加登陆验证功能时启用）
    
    return YES;
}

#pragma mark -- Set TabBar Frame
- (void)viewWillLayoutSubviews{
    
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = 44;
    tabFrame.origin.y = self.view.frame.size.height - 44;
    self.tabBar.frame = tabFrame;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
