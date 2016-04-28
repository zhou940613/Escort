//
//  BYSpecialDetail.h
//  Escort
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseModel.h"

@interface BYSpecialDetail : BYBaseModel

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *discoveryAuthor;
@property(nonatomic, copy) NSString *discoverySummary;
@property(nonatomic, copy) NSString *discoveryLikeCount;
@property(nonatomic, retain) NSArray *discoveryContent;

@end
