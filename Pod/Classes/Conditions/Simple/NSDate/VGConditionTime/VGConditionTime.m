//
//  VGConditionTime.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGConditionTime.h"

@implementation VGConditionTime

#pragma mark - VGConditionTime lifecycle

+ (instancetype)conditionWithTimePrecision:(VGTimeConditionPrecision)precision {
    return [[self alloc] initWithTimePrecision:precision];
}

- (instancetype)initWithTimePrecision:(VGTimeConditionPrecision)precision {
    self = [super init];
    if(self) {
        self.precision = precision;
    }
    return self;
}

#pragma mark - Validation

- (BOOL)checkValue:(NSDate *)value {
    // TODO: add validation
    return [super checkValue:value];
}

@end
