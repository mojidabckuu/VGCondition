//
//  VGDateEqualCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGDateEqualCondition.h"

@implementation VGDateEqualCondition

@synthesize value = _value;

#pragma mark - VGDateEqualCondition lifecycle

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

#pragma mark - Validation

- (BOOL)checkValue:(NSDate *)value {
    if([super checkValue:value]) {
        return [value compare:self.value] == NSOrderedSame;
    }
    return NO;
}

@end
