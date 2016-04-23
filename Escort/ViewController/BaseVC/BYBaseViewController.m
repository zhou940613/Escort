//
//  BYBaseViewController.m
//  Escort
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseViewController.h"

@interface BYBaseViewController ()

// ScrollView store hold view to make it scrollable
@property (strong, nonatomic) UIScrollView *scrollableView;

@end

@implementation BYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark -- Supports

- (BYCustomNavigation *)customNavigation{
    
    BYCustomNavigation *navigation = (BYCustomNavigation *) self.navigationController;
    return navigation;
}

- (void)enableSupportViewScrollableWithSize:(CGSize)scrollSize{
    // add scrollView
    if (!self.scrollableView) {
        _scrollableView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        
        for (id obj in self.view.subviews) {
            [_scrollableView addSubview:obj];
        }
        [self.view addSubview:_scrollableView];
    }
    [_scrollableView setContentSize:scrollSize];
}

- (UIScrollView *)scrollableView{
    
    return _scrollableView;
}

- (UIButton *)replaceBackButton{
    
    // create custom back button
    UIButton *buttonBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    [buttonBack setImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    [buttonBack addTarget:self action:@selector(buttonBackClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // fix button margin on iOS 7 or later
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [buttonBack setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, -15)];
    }
    
    // override back button
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:buttonBack];
    self.navigationItem.leftBarButtonItem = backItem;
    
    return buttonBack;
}

- (void)buttonBackClicked:(UIButton *)btn{
    
    // pop to previous view when it's available
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    // dismiss view when it's presenting
    else{
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
