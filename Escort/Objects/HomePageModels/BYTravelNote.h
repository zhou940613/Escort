//
//  BYTravelNote.h
//  Escort
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseModel.h"

@interface BYTravelNote : BYBaseModel

@property(nonatomic, copy) NSString *index_title;
@property(nonatomic, copy) NSString *spot_id; // nsnumber
@property(nonatomic, copy) NSString *cover_image_s; // index
@property(nonatomic, copy) NSString *cover_image_w640;  // detailCover
@property(nonatomic, copy) NSString *date_tour;
@property(nonatomic, retain) NSDictionary *user;  // name, avatar_m, user_desc
@property(nonatomic, retain) NSDictionary *poi;   // description, address, name
@property(nonatomic, copy) NSString *text;

@end
