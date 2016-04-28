//
//  BYMySettingsViewController.m
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYMySettingsViewController.h"

@interface BYMySettingsViewController ()

@end

@implementation BYMySettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self loadHeaderView];
    
    
}

#pragma mark -- Load And Set HeadeContainer View
- (void)loadHeaderView{
    
    self.userIconImg.layer.borderColor = [UIColor clearColor].CGColor;
    self.userIconImg.layer.borderWidth = 1;
    self.userIconImg.layer.masksToBounds = YES;
    self.userIconImg.layer.cornerRadius = 50;
    
    
    self.tableView.tableHeaderView = self.headContainerView;
    
}


#pragma mark -- TableView Delegate Method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 1) {
        return 2;
    }
    else if (section == 2){
        return 4;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"我的信息";
            cell.accessoryType = 1;
        }
        else{
            cell.textLabel.text = @"我的收藏";
            cell.accessoryType = 1;
        }
    }
    else if (indexPath.section == 2){
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"夜间模式";
                break;
            case 1:
                cell.textLabel.text = @"清除缓存";
                break;
            case 2:
                cell.textLabel.text = @"发送反馈";
                cell.accessoryType = 4;
                break;
            case 3:
                cell.textLabel.text = @"版本检测";
                cell.accessoryType = 4;
                break;
            default:
                break;
        }
    }
    else{
        cell.textLabel.text = @"";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            // my information
        }
        else{
            // my collection
        }
    }
    else if (indexPath.section == 2){
        switch (indexPath.row) {
            case 0:
                // night style
            case 1:
                // clear memory
            case 2:
                // send email
                break;
            case 3:
                // version test
                break;
            default:
                break;
        }
    }
    else{
    }
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
