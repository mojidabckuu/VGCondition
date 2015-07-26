//
//  VGValidator.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGValidator.h"

#import "VGCondition.h"

@implementation VGValidator

#pragma mark - VGValidator lifecycle

- (instancetype)initWithConditions:(NSArray *)conditions {
    self = [super init];
    if(self) {
        self.conditions = conditions;
    }
    return self;
}

#pragma mark - Validation

+ (BOOL)validateValue:(id)value conditions:(VGValidatorCondtionsBlock)block error:(NSError **)error {
    NSArray *conditions = block();
    VGValidator *validator = [[[self class] alloc] initWithConditions:conditions];
    validator.conditions = conditions;
    *error = [validator checkConditionsFirstErrorWithValue:value];
    return *error == nil;
}

- (NSError *)checkConditionsFirstErrorWithValue:(id)value {
    for (VGCondition *condition in self.conditions) {
        if (![condition checkValue:value]) {
            return condition.error;
        }
    }
    return nil;
}

- (NSArray *)checkConditionsWithValue:(id)value {
    NSMutableArray *errors = [NSMutableArray array];
    for (VGCondition *condition in self.conditions) {
        if (![condition checkValue:value]) {
            [errors addObject:condition.error];
        }
    }
    return errors;
}

@end
