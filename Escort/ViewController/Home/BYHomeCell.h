//
//  BYHomeCell.h
//  Escort
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYHomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bannerBGImg;
@property (weak, nonatomic) IBOutlet UIImageView *userIconImg;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberLabel;

@end
