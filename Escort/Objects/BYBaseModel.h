//
//  BYBaseModel.h
//  Escort
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYBaseModel : NSObject

/**
 *  return model arr base on dictionary arr
 *
 *  @param arr dictionary arr
 *
 *  @return model arr
 */
+ (NSMutableArray *)ModelArr_With_DictionaryArr:(NSArray *)arr;

@end
