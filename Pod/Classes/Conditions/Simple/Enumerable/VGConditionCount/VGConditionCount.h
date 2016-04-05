//
//  VGConditionCount.h
//  Pods
//
//  Created by vlad gorbenko on 10/26/15.
//
//

#import "VGEnumerableCondition.h"

@interface VGConditionCount : VGEnumerableCondition

@property (nonatomic, assign) NSInteger count;

+ (nonnull instancetype)conditionWithCount:(NSInteger)count;
+ (nonnull instancetype)conditionWithCount:(NSInteger)count description:(nonnull NSString *)description;

@end
