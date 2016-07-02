//
//  VGStringEqualCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGStringEqualCondition.h"

@implementation VGStringEqualCondition

@synthesize value = _value;

#pragma mark - VGStringEqualCondition

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

#pragma mark - Validation

- (BOOL)checkValue:(NSString *)value {
    if ([super checkValue:value]) {
        return [self.value isEqualToString:value];
    }
    return NO;
}

@end
