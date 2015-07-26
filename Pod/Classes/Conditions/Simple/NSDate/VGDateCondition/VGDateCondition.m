//
//  VGDateCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGDateCondition.h"

@implementation VGDateCondition

#pragma mark - Validation

- (BOOL)checkValue:(NSDate *)value {
    NSAssert([value isKindOfClass:[NSDate class]], @"You passed not date value.");
    return [super checkValue:value];
}

@end
