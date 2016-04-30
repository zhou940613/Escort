//
//  BYFindDetailViewController.m
//  Escort
//
//  Created by apple on 16/4/30.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYFindDetailViewController.h"

@interface BYFindDetailViewController ()

@end

@implementation BYFindDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%@", self.findModel.startTime);
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
