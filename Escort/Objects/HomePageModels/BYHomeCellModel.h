//
//  BYHomeCellModel.h
//  Escort
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseModel.h"

@interface BYHomeCellModel : BYBaseModel

@property(nonatomic, copy) NSString *view_url;
@property(nonatomic, copy) NSString *photo;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *avatar;
@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *views;
@property(nonatomic, copy) NSString *replys;

@end
