//
//  VGNumberConditionPresent.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGNumberConditionPresent.h"

@implementation VGNumberConditionPresent

#pragma mark - Validation

- (BOOL)checkValue:(NSNumber *)value {
    return [super checkValue:value] && value != nil;
}

@end
