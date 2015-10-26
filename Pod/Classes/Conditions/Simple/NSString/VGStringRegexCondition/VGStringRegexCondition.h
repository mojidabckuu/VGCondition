//
//  VGStringRegexCondition.h
//  Pods
//
//  Created by vlad gorbenko on 10/26/15.
//
//

#import "VGStringCondition.h"

@interface VGStringRegexCondition : VGStringCondition

@property (nonatomic, strong, readonly) NSString *regex;

+ (instancetype)conditionWithRegex:(NSString *)regex description:(NSString *)description;

@end
