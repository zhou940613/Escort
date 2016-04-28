//
//  BYSpecialViewController.m
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYSpecialViewController.h"

#import "BYSpecialCell.h"
#import "BYCustomTools.h"
#import "BYSpecialModel.h"

@interface BYSpecialViewController ()

@property(strong, nonatomic) NSMutableArray *modelArray;

@end

@implementation BYSpecialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // register custom cell
    [self.tableViewSpecial registerNib:[UINib nibWithNibName:@"BYSpecialCell" bundle:nil] forCellReuseIdentifier:@"BYSpecialCell"];
    self.tableViewSpecial.rowHeight = 230.0;
    self.tableViewSpecial.frame = self.view.frame;
    
     
    [self loadDate];
}

- (void)loadDate{
    
    [BYCustomTools AFGetDateWithMethodGet_BaseOnURL:@"http://dynamic.m.tuniu.com/api/trip/travel/getNewDiscoveryList?c=%7B%22v%22%3A%227.0.4%22%2C%22ct%22%3A20%2C%22dt%22%3A1%2C%22p%22%3A10593%2C%22cc%22%3A1906%7D&d=%7B%22height%22%3A400%2C%22limit%22%3A10%2C%22page%22%3A1%2C%22width%22%3A800%7D" dateBlock:^(id dateBlock) {
        NSDictionary *dic = dateBlock;
        self.modelArray = [NSMutableArray array];
        self.modelArray = [BYSpecialModel ModelArr_With_DictionaryArr:dic[@"data"][@"discoveryList"]];
        [self.tableViewSpecial reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modelArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuse = @"BYSpecialCell";
    BYSpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[BYSpecialCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    
    BYSpecialModel *special = [self.modelArray objectAtIndex:indexPath.row];
    cell.specialLabel.text = special.discoveryName;
    cell.specialLabel.numberOfLines = NSIntegerMax;
    [cell.specialImg sd_setImageWithURL:[NSURL URLWithString:special.discoveryImg]];
    return cell;
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
