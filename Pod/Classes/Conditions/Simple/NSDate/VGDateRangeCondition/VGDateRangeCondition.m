//
//  VGDateRangeCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGDateRangeCondition.h"

@implementation VGDateRangeCondition

@synthesize isStrict = _isStrict;
@synthesize min = _min;
@synthesize max = _max;

#pragma mark - VGDateRangeCondition lifecycle

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict {
    self = [super init];
    if(self) {
        self.isStrict = strict;
        self.min = min;
        self.max = max;
    }
    return self;
}

#pragma Validation

- (BOOL)checkValue:(NSDate *)value {
    BOOL superResult = [super checkValue:value];
    if(superResult) {
        // TODO: add realisation
    }
    return NO;
}

@end
