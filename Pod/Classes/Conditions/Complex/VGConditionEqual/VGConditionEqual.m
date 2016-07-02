//
//  VGConditionEqual.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGConditionEqual.h"

#import "VGStringEqualCondition.h"
#import "VGNumberEqualCondition.h"
#import "VGDateEqualCondition.h"

@implementation VGConditionEqual

@synthesize value = _value;

#pragma mark - VGConditionEqual lifecycle

+ (instancetype)conditionWithValue:(id)value {
    return [[self alloc] initWithValue:value];
}

+ (instancetype)conditionWithValue:(id)value description:(NSString *)description {
    return [[self alloc] initWithValue:value description:description];
}

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if(self) {
        self.value = value;
    }
    return self;
}

- (instancetype)initWithValue:(id)value description:(NSString *)description {
    self = [super initWithDescription:description];
    if(self) {
        self.value = value;
    }
    return self;
}

+ (void)load {
    [self registerConditionClass:[VGStringEqualCondition class] objectClass:[NSString class]];
    [self registerConditionClass:[VGStringEqualCondition class] objectClass:[NSMutableString class]];
    [self registerConditionClass:[VGStringEqualCondition class] objectClass:NSClassFromString(@"NSTaggedPointerString")];
    [self registerConditionClass:[VGNumberEqualCondition class] objectClass:[NSNumber class]];
    [self registerConditionClass:[VGDateEqualCondition class] objectClass:[NSDate class]];
}

#pragma mark - Validation

- (BOOL)checkValue:(id)value {
    id<VGEqualConditionProtocol> condition = (id<VGEqualConditionProtocol>)[self conditionByValue:value];
    condition.value = self.value;
    return [condition checkValue:value];
}

@end
