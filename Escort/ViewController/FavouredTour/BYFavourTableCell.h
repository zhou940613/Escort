//
//  BYFavourTableCell.h
//  Escort
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYFavourTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgBannerImg;
@property (weak, nonatomic) IBOutlet UIImageView *userIconImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *RMBImg;
@property (weak, nonatomic) IBOutlet UILabel *RMBLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagIconImg;

@end
