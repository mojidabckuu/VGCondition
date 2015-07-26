//
//  VGEmailCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGEmailCondition.h"

@implementation VGEmailCondition

#pragma mark - VGEmailCondition lifecylce

- (instancetype)init {
    self = [super init];
    if (self) {
        self.regex = @"^[+\\w\\.\\-']+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{2,})+$";
    }
    return self;
}

#pragma mark - Validation

- (BOOL)checkValue:(NSString *)value {
    if ([super checkValue:value]) {
        if(self.regex) {
            NSError *error = NULL;
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self.regex options:NSRegularExpressionCaseInsensitive error:&error];
            if(!error) {
                NSRange matchRange = [regex rangeOfFirstMatchInString:value options:0 range:NSMakeRange(0, value.length)];
                return (matchRange.location == 0) && (matchRange.length == value.length);
            }
        }
    }
    return NO;
}

@end
