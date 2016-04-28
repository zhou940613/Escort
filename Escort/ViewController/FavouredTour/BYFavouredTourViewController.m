//
//  BYFavouredTourViewController.m
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYFavouredTourViewController.h"
#import "BYFavourTableCell.h"
#import "BYFavourCollectionCell.h"
#import "BYFavourModel.h"

@interface BYFavouredTourViewController ()

@property(strong, nonatomic) NSMutableArray *favourArray;

@end

@implementation BYFavouredTourViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _favourArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BYFavourTableCell" bundle:nil] forCellReuseIdentifier:@"BYFavourTableCell"];
    [self.headCollectionView registerNib:[UINib nibWithNibName:@"BYFavourCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"BYFavourCollectionCell"];
    
    self.tableView.tableHeaderView = self.headContainerView;
    self.tableView.rowHeight = 295.0;
    
    [self loadDate];
}


#pragma mark -- Load Date
- (void)loadDate{
    
    [BYCustomTools AFGetDateWithMethodGet_BaseOnURL:@"http://api.breadtrip.com/hunter/products/more/?start=0&city_name=%E5%85%A8%E9%83%A8%E5%9F%8E%E5%B8%82&lat=38.88216555640611&lng=121.53864815009308" dateBlock:^(id dateBlock) {
        NSDictionary *dic = dateBlock;
        self.favourArray = [BYFavourModel ModelArr_With_DictionaryArr:dic[@"product_list"]];
        
        [self.tableView reloadData];
        [self.headCollectionView reloadData];
    }];
    
    
}

#pragma mark -- TableView Delegate Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.favourArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BYFavourTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BYFavourTableCell"];
    if (!cell) {
        cell = [[BYFavourTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"BYFavourTableCell"];
    }
    
    BYFavourModel *model = [self.favourArray objectAtIndex:indexPath.row];
    
    [cell.bgBannerImg sd_setImageWithURL:[NSURL URLWithString:model.title_page]];
    cell.bgBannerImg.layer.cornerRadius = 20;
    cell.bgBannerImg.layer.borderColor = WhiteBackGroudColor.CGColor;
    cell.bgBannerImg.layer.borderWidth = 1;
    cell.bgBannerImg.layer.masksToBounds = YES;
    
    [cell.userIconImg sd_setImageWithURL:[NSURL URLWithString:model.user[@"avatar_l"]]];
    cell.userIconImg.layer.cornerRadius = 40;
    cell.userIconImg.layer.borderColor = WhiteBackGroudColor.CGColor;
    cell.userIconImg.layer.borderWidth = 2;
    cell.userIconImg.layer.masksToBounds = YES;
    
    cell.titleLabel.text = model.title;
    cell.timeLabel.text = model.date_str;
    
    if ([[BYCustomTools returnSafeString:model.is_new] isEqualToString:@"New"]) {
        
        cell.flagIconImg.hidden = NO;
        [cell.flagIconImg setImage:[UIImage imageNamed:@"newFlag.png"]];
    }
    else{
        cell.flagIconImg.hidden = YES;
    }

    
    return cell;
}

#pragma mark -- CollectionView Delegate Method

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.favourArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BYFavourCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BYFavourCollectionCell" forIndexPath:indexPath];
    
    BYFavourModel *model = [self.favourArray objectAtIndex:indexPath.row];
    
    [cell.indexBGImg sd_setImageWithURL:[NSURL URLWithString:model.title_page]];
    cell.indexBGImg.layer.cornerRadius = 20;
    cell.indexBGImg.layer.borderWidth = 1;
    cell.indexBGImg.layer.borderColor = WhiteBackGroudColor.CGColor;
    cell.indexBGImg.layer.masksToBounds = YES;
    
    cell.descriptionLabel.text = model.title;
    cell.layer.cornerRadius = 20;
    cell.layer.borderColor = [UIColor clearColor].CGColor;
    cell.layer.borderWidth = 1;
    cell.layer.masksToBounds = YES;
    
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
