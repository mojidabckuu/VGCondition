//
//  VGStringConditionPresent.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGStringConditionPresent.h"

@implementation VGStringConditionPresent

- (BOOL)checkValue:(NSString *)value {
    return [super checkValue:value] && value.length != 0;
}

@end
