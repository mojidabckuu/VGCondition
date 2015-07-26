//
//  VGNumberRangeCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGNumberRangeCondition.h"

@implementation VGNumberRangeCondition

@synthesize isStrict = _isStrict;
@synthesize max = _max;
@synthesize min = _min;
@synthesize formatter = _formatter;

#pragma mark - VGNumberRangeCondition lifecycle

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict {
    self = [super init];
    if(self) {
        self.isStrict = strict;
        self.min = min;
        self.max = max;
    }
    return self;
}

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSNumberFormatter *)formatter {
    self = [self initWithMin:min max:max strict:strict];
    if(self) {
        self.formatter = formatter;
    }
    return self;
}

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSNumberFormatter *)formatter description:(NSString *)description {
    self = [self initWithMin:min max:max strict:strict formatter:formatter];
    if(self) {
        self.localizedDescription = description;
    }
    return self;
}

#pragma mark - Accessors

- (NSError *)error {
    NSString *description = nil;
    
    NSString *formattedMin = self.formatter ? [self.formatter stringFromNumber:self.min] : self.min;
    NSString *formattedMax = self.formatter ? [self.formatter stringFromNumber:self.max] : self.max;
    if(self.localizedDescription) {
        description = [NSString stringWithFormat:self.localizedDescription, formattedMin, formattedMax];
        const char *positionFormat = [[self.localizedDescription stringByReplacingOccurrencesOfString:@"@" withString:@"s"] UTF8String];
        const char *positionMin = [formattedMin UTF8String];
        const char *positionMax = [formattedMax UTF8String];
        char *result;
        asprintf(&result, positionFormat, positionMin, positionMax);
        description = [NSString stringWithUTF8String:result];
        free(result);
    } else {
        NSString *localizedFormat = nil;
        if(!self.min) {
            localizedFormat = NSLocalizedString(@"Enter maximum %@ value", @"VGCondition range");
            description = [NSString stringWithFormat:localizedFormat, formattedMax];
        } else if(self.max) {
            localizedFormat = NSLocalizedString(@"Enter minimum %@, maximum %@ value", @"VGCondition range");
            description = [NSString stringWithFormat:localizedFormat, formattedMin, formattedMax];
        } else {
            localizedFormat = NSLocalizedString(@"Enter minimum %@ value", @"VGCondition range");
            description = [NSString stringWithFormat:localizedFormat, formattedMin];
        }
    }    
    
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description};
    return [NSError errorWithDomain:@"com.vladgorbenko.VGContent" code:0 userInfo:userInfo];
}

#pragma mark - Validation

- (BOOL)checkValue:(NSNumber *)value {
    if([super checkValue:value]) {
        BOOL result = YES;
        if(self.min) {
            result &= [self resultBetweenValue:value limit:self.min];
        }
        if(self.max) {
            result &= [self resultBetweenValue:self.max limit:value];
        }
        return result;
    }
    return NO;
}

#pragma mark - Utils

- (BOOL)resultBetweenValue:(NSNumber *)value limit:(NSNumber *)limit {
    NSComparisonResult comparisonResult = [value compare:limit];
    if(comparisonResult == NSOrderedAscending) {
        return NO;
    } else if(comparisonResult == NSOrderedSame) {
        if(self.isStrict) {
            return NO;
        }
    }
    return YES;
}

@end
