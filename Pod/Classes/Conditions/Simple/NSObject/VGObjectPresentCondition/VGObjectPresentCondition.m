//
//  VGObjectPresentCondition.m
//  Pods
//
//  Created by Vlad Gorbenko on 13.07.15.
//
//

#import "VGObjectPresentCondition.h"

@implementation VGObjectPresentCondition

#pragma mark - Validation

- (BOOL)checkValue:(id)value {
    return [super checkValue:value] && value != nil;
}

@end
