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

+ (instancetype)conditionWithValue:(id)value;

@end
