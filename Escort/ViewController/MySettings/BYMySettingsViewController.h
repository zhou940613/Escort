//
//  BYMySettingsViewController.h
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseViewController.h"

@interface BYMySettingsViewController : BYBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *headContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *bannerBGImg;
@property (weak, nonatomic) IBOutlet UIImageView *userIconImg;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userSexImg;
@property (weak, nonatomic) IBOutlet UILabel *userDescriptionLabel;

@end
