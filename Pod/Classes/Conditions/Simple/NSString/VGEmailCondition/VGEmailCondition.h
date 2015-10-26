//
//  VGEmailCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGStringRegexCondition.h"

@interface VGEmailCondition : VGStringRegexCondition

+ (instancetype)conditionWithRegex:(NSString *)regex description:(NSString *)description NS_UNAVAILABLE;

@end
