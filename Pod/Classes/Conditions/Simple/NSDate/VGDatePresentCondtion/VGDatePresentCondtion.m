//
//  VGDatePresentCondtion.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGDatePresentCondtion.h"

@implementation VGDatePresentCondtion

#pragma mark - Validation

- (BOOL)checkValue:(NSDate *)value {
    return [super checkValue:value] && value != nil;
}

@end
