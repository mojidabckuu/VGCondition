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
    if (self.localizedDescription) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : self.localizedDescription};
        return [NSError errorWithDomain:@"com.vladgorbenko.VGCondition" code:0 userInfo:userInfo];
    }else if(self.min && self.max) {
        NSString *format = NSLocalizedString(@"Value should be between %@ and %@", nil);
        NSString *description = [NSString stringWithFormat:format, self.min, self.max];
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description};
        return [NSError errorWithDomain:@"com.vladgorbenko.VGCondition" code:0 userInfo:userInfo];
    } else if (self.min) {
        NSString *format = NSLocalizedString(@"Value should be %@ minimum", nil);
        NSString *description = [NSString stringWithFormat:format, self.min];
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description};
        return [NSError errorWithDomain:@"com.vladgorbenko.VGCondition" code:0 userInfo:userInfo];
    } else if (self.max) {
        NSString *format = NSLocalizedString(@"Value should be %@ maximum", nil);
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
                result &= [self.min isKindOfClass:[NSNumber class]] ? value.integerValue > [self.min integerValue] : [value compare:self.min] == NSOrderedDescending;
            } else {
                result &= [self.min isKindOfClass:[NSNumber class]] ? value.integerValue >= [self.min integerValue] : [value compare:self.min] != NSOrderedAscending;
            }
        }
        if(self.max) {
            if(self.isStrict) {
                result &= [self.max isKindOfClass:[NSNumber class]] ? value.integerValue < [self.max integerValue] : [value compare:self.max] == NSOrderedAscending;
            } else {
                result &= [self.max isKindOfClass:[NSNumber class]] ? value.integerValue <= [self.max integerValue] : [value compare:self.max] != NSOrderedDescending;
            }
        }
        return result;
    }
    return NO;
}

@end
