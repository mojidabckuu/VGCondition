//
//  VGComplexCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGCondition.h"

@interface VGComplexCondition : VGCondition

+ (void)registerConditionClass:(Class)conditionClass objectClass:(Class)objectClass;

- (id<VGConditionProtocol>)conditionByValue:(id)value;

@end
