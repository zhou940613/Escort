//
//  BYSpecialModel.m
//  Escort
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYSpecialModel.h"

@implementation BYSpecialModel

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.discoveryId forKey:@"discoveryId"];
    [aCoder encodeObject:self.discoveryImg forKey:@"discoveryImg"];
    [aCoder encodeObject:self.discoveryLikeCount forKey:@"discoveryLikeCount"];
    [aCoder encodeObject:self.discoveryName forKey:@"discoveryName"];
    [aCoder encodeObject:self.discoveryTag forKey:@"discoveryTag"];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if (self) {
        self.discoveryId = [aDecoder decodeObjectForKey:@"discoveryId"];
        self.discoveryImg = [aDecoder decodeObjectForKey:@"discoveryImg"];
        self.discoveryLikeCount = [aDecoder decodeObjectForKey:@"discoveryLikeCount"];
        self.discoveryName = [aDecoder decodeObjectForKey:@"discoveryName"];
        self.discoveryTag = [aDecoder decodeObjectForKey:@"discoveryTag"];
    }
    return self;
}

@end
