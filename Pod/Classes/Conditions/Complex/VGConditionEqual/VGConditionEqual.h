//
//  VGConditionEqual.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGComplexCondition.h"

#import "VGEqualConditionProtocol.h"

@interface VGConditionEqual : VGComplexCondition <VGEqualConditionProtocol>

#pragma mark - Objc-C convient methods
+ (nonnull instancetype)conditionWithValue:(nonnull id)value;
+ (nonnull instancetype)conditionWithValue:(nonnull id)value description:(nonnull NSString *)description;

#pragma mark - Swift initializers
- (nonnull instancetype)initWithValue:(nonnull id)value;
- (nonnull instancetype)initWithValue:(nonnull id)value description:(nonnull NSString *)description;
@end
