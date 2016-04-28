//
//  BYFindViewController.m
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYFindViewController.h"
#import "BYFindCell.h"
#import "BYFindModel.h"

@interface BYFindViewController ()

@property(strong, nonatomic) NSMutableArray *findArray;

@end

@implementation BYFindViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _findArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableViewFind registerNib:[UINib nibWithNibName:@"BYFindCell" bundle:nil] forCellReuseIdentifier:@"BYFindCell"];
    self.tableViewFind.rowHeight = 200;
    
    [self loadDate];
}

- (void)loadDate{
    
    [BYCustomTools AFGetDateWithMethodGet_BaseOnURL:@"http://dynamic.m.tuniu.com/api/chat/companion/recommendMessageList?c=%7B%22v%22%3A%227.0.4%22%2C%22ct%22%3A20%2C%22dt%22%3A1%2C%22p%22%3A10593%2C%22cc%22%3A200%7D&d=%7B%22sessionId%22%3A%221677bebe35062e1155cef1f95aa65844%22%2C%22page%22%3A1%2C%22limit%22%3A10%7D" dateBlock:^(id dateBlock) {
        NSDictionary *dic = dateBlock;
        self.findArray = [BYFindModel ModelArr_With_DictionaryArr:dic[@"data"][@"list"]];
        
        [self.tableViewFind reloadData];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.findArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BYFindCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BYFindCell"];
    if (!cell) {
        cell = [[BYFindCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"BYFindCell"];
    }
    
    BYFindModel *model = [self.findArray objectAtIndex:indexPath.row];
    
    [cell.userIconImg sd_setImageWithURL:[NSURL URLWithString:model.userIcon]];
    cell.userIconImg.layer.cornerRadius = 35;
    cell.userIconImg.layer.borderWidth = 1;
    cell.userIconImg.layer.borderColor = WhiteBackGroudColor.CGColor;
    cell.userIconImg.layer.masksToBounds = YES;
    
    cell.userNameLabel.text = model.nickname;
    cell.pubTimeLabel.text = model.publishTime;
    cell.postionLabel.text = model.publishPoiName;
    cell.albumLabel.text = @"个人相册";
    
    if (model.picList.count) {
        if (model.picList.count == 1) {
            [cell.albumLeftImg sd_setImageWithURL:[NSURL URLWithString:model.picList[0][@"picUrl"]]];
            cell.albumCenterImg.hidden = YES;
            cell.albumRightImg.hidden = YES;
        }
        else if (model.picList.count == 2){
            [cell.albumLeftImg sd_setImageWithURL:[NSURL URLWithString:model.picList[0][@"picUrl"]]];
            [cell.albumCenterImg sd_setImageWithURL:[NSURL URLWithString:model.picList[1][@"picUrl"]]];
            cell.albumRightImg.hidden = YES;
        }
        else if (model.picList.count == 3){
            [cell.albumLeftImg sd_setImageWithURL:[NSURL URLWithString:model.picList[0][@"picUrl"]]];
            [cell.albumCenterImg sd_setImageWithURL:[NSURL URLWithString:model.picList[1][@"picUrl"]]];
            [cell.albumRightImg sd_setImageWithURL:[NSURL URLWithString:model.picList[2][@"picUrl"]]];
        }
        else{
            [cell.albumLeftImg sd_setImageWithURL:[NSURL URLWithString:model.picList[0][@"picUrl"]]];
            [cell.albumCenterImg sd_setImageWithURL:[NSURL URLWithString:model.picList[1][@"picUrl"]]];
            [cell.albumRightImg sd_setImageWithURL:[NSURL URLWithString:model.picList[2][@"picUrl"]]];
        }
    }
    else{
        cell.albumLeftImg.hidden = YES;
        cell.albumCenterImg.hidden = YES;
        cell.albumRightImg.hidden = YES;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
