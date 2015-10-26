//
//  VGEnumerableCondition.m
//  Pods
//
//  Created by vlad gorbenko on 10/26/15.
//
//

#import "VGEnumerableCondition.h"

@implementation VGEnumerableCondition

#pragma mark - Validation

- (BOOL)checkValue:(id)value {
    if([super checkValue:value]) {
        return [value respondsToSelector:@selector(count)];
    }
    return NO;
}

#pragma mark - Accessors

- (NSError *)error {
    NSString *message = NSLocalizedString(@"Value is not a collection or doesn't support enumeration", @"VGEnumerable condition");
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : message};
    return [NSError errorWithDomain:@"com.vladgorbenko" code:0 userInfo:userInfo];
}

@end
