//
//  BYFindModel.h
//  Escort
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseModel.h"

@interface BYFindModel : BYBaseModel

@property(nonatomic, copy) NSString *userIcon;
@property(nonatomic, copy) NSString *nickname;
@property(nonatomic, copy) NSString *publishTime;
@property(nonatomic, copy) NSString *startTime;
@property(nonatomic, copy) NSString *content;
@property(nonatomic, copy) NSString *publishPoiName;
@property(nonatomic, retain) NSArray *scenicList;

@property(nonatomic, retain) NSArray *picList;

@end
