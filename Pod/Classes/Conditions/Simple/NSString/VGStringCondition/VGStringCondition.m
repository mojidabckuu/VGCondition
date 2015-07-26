//
//  VGStringCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGStringCondition.h"

@implementation VGStringCondition

#pragma mark - Validation

- (BOOL)checkValue:(NSString *)value {
    NSAssert([value isKindOfClass:[NSString class]], @"You passed value wich is not string");
    return [super checkValue:value];
}

@end
