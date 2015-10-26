//
//  VGConditionPresent.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGConditionPresent.h"

#import "VGObjectPresentCondition.h"
#import "VGStringConditionPresent.h"
#import "VGNumberConditionPresent.h"
#import "VGDatePresentCondtion.h"
#import "VGEnumerableConditionPresent.h"

@implementation VGConditionPresent

+ (void)load {
    [self registerConditionClass:[VGObjectPresentCondition class] objectClass:[NSObject class]];
    [self registerConditionClass:[VGStringConditionPresent class] objectClass:[NSString class]];
    [self registerConditionClass:[VGNumberCondition class] objectClass:[NSNumber class]];
    [self registerConditionClass:[VGDatePresentCondtion class] objectClass:[NSDate class]];
    
    [self registerConditionClass:[VGEnumerableConditionPresent class] objectClass:[NSArray class]];
    [self registerConditionClass:[VGEnumerableConditionPresent class] objectClass:[NSDictionary class]];
    [self registerConditionClass:[VGEnumerableConditionPresent class] objectClass:[NSSet class]];
}

#pragma mark - Accessors

- (NSError *)error {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : NSLocalizedString(@"Field can't be empty", nil)};
    return [NSError errorWithDomain:@"com.vladgorbenko.VGContent" code:0 userInfo:userInfo];
}

@end
