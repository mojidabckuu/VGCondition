//
//  VGConditionCount.h
//  Pods
//
//  Created by vlad gorbenko on 10/26/15.
//
//

#import <VGCondition/VGCondition.h>

@interface VGConditionCount : VGCondition

@property (nonatomic, assign) NSInteger count;

+ (instancetype)conditionWithCount:(NSInteger)count;
+ (instancetype)conditionWithCount:(NSInteger)count description:(NSString *)description;

@end
