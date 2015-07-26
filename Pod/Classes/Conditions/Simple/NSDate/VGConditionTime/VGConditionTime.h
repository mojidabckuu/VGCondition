//
//  VGConditionTime.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGDateCondition.h"

typedef NS_ENUM(NSInteger, VGTimeConditionPrecision) {
    VGTimeConditionPrecisionHours,
    VGTimeConditionPrecisionMinutes,
    VGTimeConditionPrecisionSeconds,
    VGTimeConditionPrecisionMilliSeconds
};

@interface VGConditionTime : VGDateCondition

@property (nonatomic, assign) VGTimeConditionPrecision precision;

+ (instancetype)conditionWithTimePrecision:(VGTimeConditionPrecision)precision;

- (instancetype)initWithTimePrecision:(VGTimeConditionPrecision)precision;

@end
