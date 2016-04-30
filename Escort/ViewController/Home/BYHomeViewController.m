//
//  BYHomeViewController.m
//  Escort
//
//  Created by apple on 16/4/23.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYHomeViewController.h"
#import "BYCustomTools.h"

// objects
#import "BYRoller.h"
#import "BYTravelNote.h"
#import "BYHomeCellModel.h"

// cells
#import "BYHomeCell.h"
#import "BYHomeItemCell.h"

// viewContrillers
#import "BYWebViewController.h"
#import "BYTravelViewController.h"
#import "BYHotelViewController.h"

// Url Define


@interface BYHomeViewController ()<UIScrollViewDelegate>

@property(strong, nonatomic) IBOutlet UIView *headerView;

@property(strong, nonatomic) NSMutableArray *rollerArray;
@property(strong, nonatomic) NSMutableArray *travelArray;
@property(strong, nonatomic) NSMutableArray *homeCellArray;
@property(strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation BYHomeViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _rollerArray = [NSMutableArray array];
        _travelArray = [NSMutableArray array];
        _homeCellArray = [NSMutableArray array];
        _itemArray = [NSMutableArray array];
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [self.scrollerView setContentOffset:CGPointMake(0, 0)];
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BYHomeCell" bundle:nil] forCellReuseIdentifier:@"BYHomeCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"BYHomeItemCell" bundle:nil] forCellWithReuseIdentifier:@"BYHomeItemCell"];
    
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.rowHeight = 267.0;
    
    // set roller autoroll
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoRoll) userInfo:nil repeats:YES];
    
#warning fix size for collectionView
    // 6/6s left-margin:18 cell spacing:20
    // 6p/6sp
    // 4/4s/5/5s/5se 
    
    [self loadDate];
}


#pragma mark -- Load Date
- (void)loadDate{
    
    [BYCustomTools AFGetDateWithMethodGet_BaseOnURL:HOME_DATESOURCE_1 dateBlock:^(id dateBlock) {
        
        NSDictionary *rollerDic = dateBlock;
        self.rollerArray = [BYRoller ModelArr_With_DictionaryArr:rollerDic[@"data"][@"elements"][0][@"data"][0]];
        [self.rollerArray addObject:self.rollerArray.firstObject];
        
        // set roller pictures
        self.scrollerView.pagingEnabled = YES;
        self.scrollerView.bounces = YES;
        
        if (self.rollerArray.count >= 1) {
            
            self.scrollerView.contentSize = CGSizeMake(SCREEN_WIDTH * self.rollerArray.count, 0);
            
            NSInteger temp = self.rollerArray.count;
            for (NSInteger i = 0; i < temp; i++) {
                UIImageView *imageView = [[UIImageView alloc] init];
                imageView.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, 230);
                imageView.userInteractionEnabled = YES;
                
                BYRoller *rollermodel = [self.rollerArray objectAtIndex:i];
                [imageView BYSD_SETIMG_NAME(rollermodel.image_url)];
                [self.scrollerView addSubview:imageView];
                
                // tapGesture set
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToDetailPage:)];
                [imageView addGestureRecognizer:tap];
            }
        }else{
            self.scrollerView.hidden = YES;
        }
        [self.tableView reloadData];
    }];
    
    for (NSInteger i = 0; i < 4; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"item_%ld.png", i]];
        [self.itemArray addObject:image];
    }
    
    [BYCustomTools AFGetDateWithMethodGet_BaseOnURL:HOME_DATESOURCE_2 dateBlock:^(id dateBlock) {
        
        NSDictionary *dic = dateBlock;
        self.travelArray = [BYTravelNote ModelArr_With_DictionaryArr:dic[@"data"][@"hot_spot_list"]];
        // set travel notes
        BYTravelNote *note1 = self.travelArray[0];
        BYTravelNote *note2 = self.travelArray[2];
        BYTravelNote *note3 = self.travelArray[3];
        
        [self.leftImg BYSD_SETIMG_NAME(note1.cover_image_s)];
        [self.rightUpImg BYSD_SETIMG_NAME(note2.cover_image_s)];
        [self.rightDownImg BYSD_SETIMG_NAME(note3.cover_image_s)];
        
        [self.tableView reloadData];
    }];
    
    [BYCustomTools AFGetDateWithMethodGet_BaseOnURL:HOME_DATESOURCE_3 dateBlock:^(id dateBlock) {
        
        NSDictionary *dic = dateBlock;
        self.homeCellArray = [BYHomeCellModel ModelArr_With_DictionaryArr:dic[@"data"]];
        // set home cell
        
        [self.tableView reloadData];
    }];
    
}

#pragma mark -- Set Roller AutoRoll

- (void)autoRoll{
    
    [self.scrollerView setContentOffset:CGPointMake(self.scrollerView.contentOffset.x + SCREEN_WIDTH, 0) animated:YES];
    if (self.scrollerView.contentOffset.x == (self.rollerArray.count - 1) * SCREEN_WIDTH) {
        [self.scrollerView setContentOffset:CGPointMake(0, 0)];
    }
}

- (void)jumpToDetailPage:(UITapGestureRecognizer *)tap{
    BYWebViewController *webVC = [[BYWebViewController alloc] init];
    
    CGFloat i = self.scrollerView.contentOffset.x / SCREEN_WIDTH;
    BYRoller *rollermodel = [self.rollerArray objectAtIndex:i];
    webVC.URLString = rollermodel.html_url;
    
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark -- HomeItem Set

#pragma mark -- Travel Notes Link
- (IBAction)moreButtonClick:(id)sender {
    
    BYTravelViewController *travelVC = [[BYTravelViewController alloc] init];
    [self.navigationController pushViewController:travelVC animated:YES];
    
}

#pragma mark -- TableView Delegate Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.homeCellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BYHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BYHomeCell"];
    if (!cell) {
        cell = [[BYHomeCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"BYHomeCell"];
    }
    
    BYHomeCellModel *model = [self.homeCellArray objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = model.title;
    [cell.bannerBGImg sd_setImageWithURL:[NSURL URLWithString:model.photo]];
    
    [cell.userIconImg sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    cell.userIconImg.layer.borderWidth = 1;
    cell.userIconImg.layer.borderColor = WhiteBackGroudColor.CGColor;
    cell.userIconImg.layer.masksToBounds = YES;
    cell.userIconImg.layer.cornerRadius = 50;
    
    cell.userNameLabel.text = model.username;
    cell.viewNumberLabel.text = [NSString stringWithFormat:@"%@", model.views];
    cell.commentNumberLabel.text = [NSString stringWithFormat:@"%@", model.replys];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BYWebViewController *webVC = [[BYWebViewController alloc] init];
    
    BYHomeCellModel *model = [self.homeCellArray objectAtIndex:indexPath.row];
    webVC.URLString = model.view_url;
    
    [self.navigationController pushViewController:webVC animated:YES];
}


#pragma mark -- CollectionView Delegate Method

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BYHomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BYHomeItemCell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.itemLabel.text = @"酒店";
            [cell.itemIconImg setImage:self.itemArray[0]];
            break;
        case 1:
            cell.itemLabel.text = @"景点";
            [cell.itemIconImg setImage:self.itemArray[1]];
            break;
        case 2:
            cell.itemLabel.text = @"签证";
            [cell.itemIconImg setImage:self.itemArray[2]];
            break;
        case 3:
            cell.itemLabel.text = @"股票";
            [cell.itemIconImg setImage:self.itemArray[3]];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BYHotelViewController *hotelVC = [[BYHotelViewController alloc] init];
    BYWebViewController *webViewVC = [[BYWebViewController alloc] init];
    
    switch (indexPath.row) {
        case 0:
            hotelVC.URLString = HOTEL_URL;
            [self.navigationController pushViewController:hotelVC animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:webViewVC animated:YES];
            webViewVC.URLString = SIGHT_URL;
            break;
        case 2:
            [self.navigationController pushViewController:webViewVC animated:YES];
            webViewVC.URLString = VISA_URL;
            break;
        case 3:
            [self.navigationController pushViewController:webViewVC animated:YES];
            webViewVC.URLString = STOCK_URL;
            break;
        default:
            break;
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
