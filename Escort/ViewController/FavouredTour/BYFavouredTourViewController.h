//
//  BYFavouredTourViewController.h
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseViewController.h"

@interface BYFavouredTourViewController : BYBaseViewController<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *headContainerView;

@property (weak, nonatomic) IBOutlet UIImageView *headBannerImg;
@property (weak, nonatomic) IBOutlet UICollectionView *headCollectionView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
