//
//  VGAlphabeticCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGStringRegexCondition.h"

@interface VGAlphabeticCondition : VGStringRegexCondition

@property (nonatomic, assign) BOOL allowWhitespace;
@property (nonatomic, assign) BOOL allowNumbers;

+ (instancetype)conditionWithNumbers:(BOOL)allowNumbers whitespace:(BOOL)allowWhiteSpace desription:(NSString *)description;

- (instancetype)initWithNumbers:(BOOL)allowNumbers whitespace:(BOOL)allowWhiteSpace desription:(NSString *)description;

+ (instancetype)conditionWithDescription:(NSString *)description NS_UNAVAILABLE;
+ (instancetype)conditionWithRegex:(NSString *)regex description:(NSString *)description NS_UNAVAILABLE;

@end
