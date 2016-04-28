//
//  BYFindCell.h
//  Escort
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYFindCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userIconImg;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *pubTimeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *positionImg;
@property (weak, nonatomic) IBOutlet UILabel *postionLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moreImg;
@property (weak, nonatomic) IBOutlet UIImageView *albumLeftImg;
@property (weak, nonatomic) IBOutlet UIImageView *albumCenterImg;
@property (weak, nonatomic) IBOutlet UIImageView *albumRightImg;




@end
