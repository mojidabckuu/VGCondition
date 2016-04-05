//
//  VGComplexCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGCondition.h"

@interface VGComplexCondition : VGCondition

+ (void)registerConditionClass:(_Nonnull Class)conditionClass objectClass:(_Nonnull Class)objectClass;

- (nonnull id<VGConditionProtocol>)conditionByValue:(nonnull id)value;

@end
