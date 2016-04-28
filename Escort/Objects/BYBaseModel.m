//
//  BYBaseModel.m
//  Escort
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYBaseModel.h"

@implementation BYBaseModel

+ (NSMutableArray *)ModelArr_With_DictionaryArr:(NSArray *)arr{
    
    NSMutableArray *modelArr = [NSMutableArray array];
    
    for (NSDictionary *dic in arr) {
        id model = [[self class] baseModelWithDic:dic];
        [modelArr addObject:model];
    }
    
    return modelArr;
}

+ (instancetype)baseModelWithDic:(NSDictionary *)dic{
    
    id model = [[[self class] alloc] initWithDic:dic];
    return model;
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
