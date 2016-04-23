//
//  BYSplashViewController.m
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYSplashViewController.h"

@interface BYSplashViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BYSplashViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    // animation for splash controller
    [UIView animateWithDuration:3.0 animations:^{
        self.imageView.frame = CGRectMake(-50, 0, [UIScreen mainScreen].bounds.size.width + 100, [UIScreen mainScreen].bounds.size.height + 200);
        self.imageView.alpha = 0;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

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
