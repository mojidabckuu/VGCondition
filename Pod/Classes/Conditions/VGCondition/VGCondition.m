//
//  VGCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGCondition.h"

@implementation VGCondition

@synthesize error = _error;
@synthesize localizedDescription = _localizedDescription;

#pragma mark - VGCondition lifecycle

+ (instancetype)condition {
    return [[self alloc] init];
}

+ (instancetype)conditionWithDescription:(NSString *)description {
    return [[self alloc] initWithDescription:description];
}

- (instancetype)initWithDescription:(NSString *)description {
    self = [super init];
    if(self) {
        _localizedDescription = description;
    }
    return self;
}

#pragma mark - Validators

- (BOOL)checkValue:(id)value {
    return YES;
}

#pragma mark - Accessors

- (NSError *)error {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : self.localizedDescription ?: NSLocalizedString(@"Field is not valid", nil)};
    return [NSError errorWithDomain:@"com.vladgorbenko.VGCondition" code:0 userInfo:userInfo];
}

@end
