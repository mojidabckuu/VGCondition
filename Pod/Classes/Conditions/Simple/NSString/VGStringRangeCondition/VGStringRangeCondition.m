//
//  VGStringRangeCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGStringRangeCondition.h"

@implementation VGStringRangeCondition

@synthesize isStrict = _isStrict;
@synthesize formatter = _formatter;

#pragma mark - VGStringRangeCondition

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict {
    self = [super init];
    if(self) {
        self.isStrict = strict;
        self.min = min;
        self.max = max;
    }
    return self;
}

#pragma mark - Accessors

- (NSError *)error {
    NSString *format = NSLocalizedString(@"Enter minimum %@, maximum %@ characters", nil);
    NSString *description = [NSString stringWithFormat:format, self.min ?: @0, self.max ?: @0];
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description};
    return [NSError errorWithDomain:@"com.vladgorbenko.VGContent" code:0 userInfo:userInfo];
}

#pragma mark - Validation

- (BOOL)checkValue:(NSString *)value {
    if([super checkValue:value]) {
        BOOL result = YES;
        if(self.min) {
            if(self.isStrict) {
                result &= value.length > self.min.integerValue;
            } else {
                result &= value.length >= self.min.integerValue;
            }
        }
        if(self.max) {
            if(self.isStrict) {
                result &= value.length < self.max.integerValue;
            } else {
                result &= value.length <= self.max.integerValue;
            }
        }
        return result;
    }
    return NO;
}

@end
