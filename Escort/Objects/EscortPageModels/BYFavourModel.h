//
//  BYFavourModel.h
//  Escort
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseModel.h"

@interface BYFavourModel : BYBaseModel

@property(nonatomic, copy) NSString *title_page;
@property(nonatomic, copy) NSString *is_new;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *date_str;
@property(nonatomic, copy) NSString *address;
@property(nonatomic, copy) NSString *like_count;
@property(nonatomic, retain) NSDictionary *user;
@property(nonatomic, copy) NSString *product_id;
@property(nonatomic, copy) NSString *price;

@end
