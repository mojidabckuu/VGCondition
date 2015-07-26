//
//  VGNumberEqualCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGNumberEqualCondition.h"

@implementation VGNumberEqualCondition

@synthesize value = _value;

#pragma mark - VGNumberEqualCondition lifecycle

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

#pragma mark - Validation

- (BOOL)checkValue:(NSNumber *)value {
    if ([super checkValue:value]) {
        return [value compare:self.value] == NSOrderedSame;
    }
    return NO;
    
}

@end
