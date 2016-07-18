//
//  VGComplexCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGComplexCondition.h"

@implementation VGComplexCondition

#pragma mark - Condtions management

+ (void)registerConditionClass:(Class)conditionClass objectClass:(Class)objectClass {
    NSString *conditionClassString = NSStringFromClass(conditionClass);
    if(objectClass) {
        NSString *objectClassString = NSStringFromClass(objectClass);
        [self setConditonClass:conditionClassString toObjectClass:objectClassString];
    }
}

#pragma mark - Accessors

+ (NSMutableDictionary *)complexConditions {
    static NSMutableDictionary *complexConditions = nil;
    if(!complexConditions) {
        complexConditions = [[NSMutableDictionary alloc] init];
    }
    return complexConditions;
}

#pragma mark - Validation

- (BOOL)checkValue:(id)value {
    if(!value) {
        return NO;
    }
    VGCondition *condition = [self conditionByValue:value];
    return [condition checkValue:value];
}

- (id<VGConditionProtocol>)conditionByValue:(id)value {
    NSString *objectClassString = NSStringFromClass([value class]);
    NSString *conditionClassString = [[self class] conditionClassForObjectClass:objectClassString value:value];
    Class conditionClass = NSClassFromString(conditionClassString);
    NSAssert(conditionClass, @"Condition for class %@ doesn't exist", [value class]);
    return [[conditionClass alloc] initWithDescription:self.localizedDescription];
}

#pragma mark - Utils

+ (void)setConditonClass:(NSString *)condtionClass toObjectClass:(NSString *)objectClass {
    NSMutableDictionary *complexConditions = self.complexConditions;
    NSString *classKey = NSStringFromClass([self class]);
    NSMutableDictionary *classRelativeDictionary = complexConditions[classKey];
    if(!classRelativeDictionary) {
        classRelativeDictionary = [NSMutableDictionary dictionary];
        [complexConditions setObject:classRelativeDictionary forKey:classKey];
    }
    if([classRelativeDictionary objectForKey:objectClass]) {
        [classRelativeDictionary removeObjectForKey:objectClass];
    }
    [classRelativeDictionary setObject:condtionClass forKey:objectClass];
}

+ (NSString *)conditionClassForObjectClass:(NSString *)objectClass value:(id)value {
    NSDictionary *complexConditions = self.complexConditions;
    NSString *classKey = NSStringFromClass([self class]);
    NSMutableDictionary *classRelativeDictionary = complexConditions[classKey];
    NSString *conditionClassString = classRelativeDictionary[objectClass];
    if(!conditionClassString) {
        for(NSString *objectClassString in classRelativeDictionary.allKeys) {
            Class class = NSClassFromString(objectClassString);
            if([value isKindOfClass:class]) {
                conditionClassString = classRelativeDictionary[objectClassString];
                break;
            }
        }
    }
    return conditionClassString;
}

@end
