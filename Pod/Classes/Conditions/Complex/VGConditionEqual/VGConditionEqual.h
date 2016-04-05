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

+ (nonnull instancetype)conditionWithValue:(nonnull id)value;
+ (nonnull instancetype)conditionWithValue:(nonnull id)value description:(nonnull NSString *)description;

- (nonnull instancetype)initWithValue:(nonnull id)value;
- (nonnull instancetype)initWithValue:(nonnull id)value description:(nonnull NSString *)description;
@end
