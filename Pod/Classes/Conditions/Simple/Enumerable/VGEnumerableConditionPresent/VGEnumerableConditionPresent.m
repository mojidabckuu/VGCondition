//
//  VGEnumerableConditionPresent.m
//  Pods
//
//  Created by vlad gorbenko on 10/26/15.
//
//

#import "VGEnumerableConditionPresent.h"

@implementation VGEnumerableConditionPresent

#pragma mark - Validation

- (BOOL)checkValue:(id)value {
    return [super checkValue:value] && [value count] > 0;
}

@end
