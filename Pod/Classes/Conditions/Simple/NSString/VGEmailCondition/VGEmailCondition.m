//
//  VGEmailCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGEmailCondition.h"

NSString *const VGEmailConditionRegex = @"^[+\\w\\.\\-']+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{2,})+$";

@implementation VGEmailCondition

#pragma mark - Accessors

- (NSString *)regex {
    return VGEmailConditionRegex;
}

- (NSError *)error {
    NSString *message = self.localizedDescription ?: NSLocalizedString(@"Email address is not valid", nil);
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : message };
    return [NSError errorWithDomain:@"com.vladgorbenko" code:0 userInfo:userInfo];
}

@end
