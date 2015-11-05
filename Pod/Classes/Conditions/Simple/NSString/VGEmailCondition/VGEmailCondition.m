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

#pragma mark - Lifecycle

+ (instancetype)conditionWithDescription:(NSString *)description allowEmpty:(BOOL)allowEmpty {
    return [[self alloc] initWithDescription:description allowEmpty:allowEmpty];
}

- (instancetype)initWithDescription:(NSString *)description allowEmpty:(BOOL)allowEmpty {
    self = [super initWithDescription:description];
    if(self) {
        self.allowEmpty = allowEmpty;
    }
    return self;
}

#pragma mark - Accessors

- (NSString *)regex {
    return VGEmailConditionRegex;
}

- (NSError *)error {
    NSString *message = self.localizedDescription ?: NSLocalizedString(@"Email address is not valid", nil);
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : message };
    return [NSError errorWithDomain:@"com.vladgorbenko" code:0 userInfo:userInfo];
}

#pragma mark - Validation

- (BOOL)checkValue:(NSString *)value {
    NSAssert([value isKindOfClass:[NSString class]], @"You passed value wich is not string");
    if(self.allowEmpty && value.length == 0) {
        return YES;
    }
    return [super checkValue:value];
}

@end
