//
//  BYHomeViewController.h
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseViewController.h"

@interface BYHomeViewController : BYBaseViewController<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightUpImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightDownImg;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end
