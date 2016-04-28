//
//  BYCustomNavigation.m
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYCustomNavigation.h"
#import "BYDefined.h"
@interface BYCustomNavigation ()

@end

@implementation BYCustomNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    
    // mark 1
}

#pragma mark -- Add Separator Line
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    // add separator line for the bottom of navigationBar
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.navigationBar.frame), [[UIScreen mainScreen] bounds].size.width, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.navigationBar addSubview:line];
    self.navigationBar.barTintColor = Rgb2UIColor(73, 73, 73);
}

#pragma mark -- Override Push Method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:YES];
    
    UINavigationItem *navigationItem = viewController.navigationController.navigationItem;
    
    BOOL left1 = navigationItem.leftBarButtonItem != nil;
    BOOL left2 = navigationItem.leftBarButtonItems && navigationItem.leftBarButtonItems.count > 0;
    BOOL hasBackButton = viewController.navigationController.viewControllers.count > 1;
    
    if (!left1 && !left2 && hasBackButton) {
        // create custom back button
        UIButton *buttonBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
        [buttonBack setImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
        [buttonBack addTarget:self action:@selector(buttonBackClicked:) forControlEvents:UIControlEventTouchUpInside];
        // fix bug in ios 7 or later
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
            [buttonBack setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, -15)];
        }
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:buttonBack];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
}

#pragma mark -- Button Back Method
- (void)buttonBackClicked:(UIButton *)btn{
    
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- NavigationController Method
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
-(BOOL)shouldAutorotate{
    return YES;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return  UIInterfaceOrientationPortrait;
}


@end
