//
//  VGNumberCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGNumberCondition.h"

@implementation VGNumberCondition

#pragma mark - Validation

- (BOOL)checkValue:(NSNumber *)value {
    NSAssert([value isKindOfClass:[NSNumber class]], @"You passed not NSNUmber value.");
    return [super checkValue:value];
}

@end
