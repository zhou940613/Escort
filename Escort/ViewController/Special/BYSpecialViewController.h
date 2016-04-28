//
//  BYSpecialViewController.h
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseViewController.h"

@interface BYSpecialViewController : BYBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewSpecial;

@end
