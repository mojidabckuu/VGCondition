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

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter {
    return [self initWithMin:min max:max strict:strict];
}

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter description:(NSString *)description {
    self = [super initWithDescription:description];
    if(self) {
        self.isStrict = strict;
        self.min = min;
        self.max = max;
    }
    return self;
}

#pragma mark - Accessors

- (NSError *)error {
    if(self.min && self.max) {
        NSString *format = NSLocalizedString(@"Enter minimum %@, maximum %@ characters", nil);
        NSString *description = [NSString stringWithFormat:format, self.min, self.max];
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description};
        return [NSError errorWithDomain:@"com.vladgorbenko.VGCondition" code:0 userInfo:userInfo];
    } else if (self.min) {
        NSString *format = NSLocalizedString(@"Enter minimum %@ characters", nil);
        NSString *description = [NSString stringWithFormat:format, self.min];
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description};
        return [NSError errorWithDomain:@"com.vladgorbenko.VGCondition" code:0 userInfo:userInfo];
    } else if (self.max) {
        NSString *format = NSLocalizedString(@"Enter maximum %@ characters", nil);
        NSString *description = [NSString stringWithFormat:format, self.max];
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description};
        return [NSError errorWithDomain:@"com.vladgorbenko.VGCondition" code:0 userInfo:userInfo];
    }
    return [NSError errorWithDomain:@"com.vladgorbenko.VGCondition" code:0 userInfo:@{}];
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
