//
//  VGConditonRange.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGConditonRange.h"

#import "VGDateRangeCondition.h"
#import "VGNumberRangeCondition.h"
#import "VGStringRangeCondition.h"

@interface VGConditonRange ()

@property (nonatomic, strong) VGCondition *condition;

@end

@implementation VGConditonRange

@synthesize isStrict = _isStrict;
@synthesize min = _min;
@synthesize max = _max;
@synthesize formatter = _formatter;

#pragma mark - VGConditonRange lifecylce

+ (instancetype)conditionWithMin:(id)min max:(id)max strict:(BOOL)strict {
    return [[self alloc] initWithMin:min max:max strict:strict];
}

+ (instancetype)conditionWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter {
    return [[self alloc] initWithMin:min max:max strict:strict formatter:formatter];
}

+ (instancetype)conditionWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter description:(NSString *)description {
    return [[self alloc] initWithMin:min max:max strict:strict formatter:formatter description:description];
}

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
    self = [self initWithMin:min max:max strict:strict];
    if(self) {
        self.formatter = formatter;
    }
    return self;
}

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter description:(NSString *)description {
    self = [self initWithMin:min max:max strict:strict formatter:formatter];
    if(self) {
        self.localizedDescription = description;
    }
    return self;
}

+ (void)load {
    [self registerConditionClass:[VGStringRangeCondition class] objectClass:[NSString class]];
    [self registerConditionClass:[VGNumberRangeCondition class] objectClass:[NSNumber class]];
    [self registerConditionClass:[VGDateRangeCondition class] objectClass:[NSDate class]];
}

#pragma mark - Accessors

- (NSError *)error {
    return self.condition.error;
}

#pragma mark - Validation

- (BOOL)checkValue:(id)value {
    id<VGRangeConditionProtocol> condition = (id<VGRangeConditionProtocol>)[self conditionByValue:value];
    [condition setIsStrict:self.isStrict];
    [condition setMin:self.min];
    [condition setMax:self.max];
    [condition setFormatter:self.formatter];
    [condition setLocalizedDescription:self.localizedDescription];
    self.condition = condition;
    return [condition checkValue:value];
}

@end
