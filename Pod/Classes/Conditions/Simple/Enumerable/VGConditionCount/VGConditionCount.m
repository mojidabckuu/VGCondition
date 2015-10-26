//
//  VGConditionCount.m
//  Pods
//
//  Created by vlad gorbenko on 10/26/15.
//
//

#import "VGConditionCount.h"

@implementation VGConditionCount

#pragma mark - Lifecycle

+ (instancetype)conditionWithCount:(NSInteger)count {
    return [[self alloc] initWithCount:count description:nil];
}

+ (instancetype)conditionWithCount:(NSInteger)count description:(NSString *)description {
    return [[self alloc] initWithCount:count description:description];
}

- (instancetype)initWithCount:(NSInteger)count description:(NSString *)description {
    self = [super initWithDescription:description];
    if(self) {
        self.count = count;
    }
    return self;
}

#pragma mark - Accessors

- (NSError *)error {
    NSError *error = nil;
    
    NSString *description = nil;
    NSString *numberOfItems = [NSString stringWithFormat:@"%ld", self.count];
    if(self.localizedDescription) {
        NSString *description = [NSString stringWithFormat:self.localizedDescription, numberOfItems];
        const char *positionFormat = [[self.localizedDescription stringByReplacingOccurrencesOfString:@"%@" withString:@"%s"] UTF8String];
        const char *positionNumberOfItems = [numberOfItems UTF8String];
        char *result;
        asprintf(&result, positionFormat, positionNumberOfItems);
        description = [NSString stringWithUTF8String:result];
        free(result);
    } else {
        NSString *localizedFormat = NSLocalizedString(@"Number of items should be equal to %@", @"VGCondition count");
        description = [NSString stringWithFormat:localizedFormat, numberOfItems];
    }
    
    return error;
}

@end
