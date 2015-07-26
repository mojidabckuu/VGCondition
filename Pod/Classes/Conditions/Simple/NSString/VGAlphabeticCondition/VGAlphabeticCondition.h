//
//  VGAlphabeticCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGStringCondition.h"

@interface VGAlphabeticCondition : VGStringCondition

@property (nonatomic, assign) BOOL allowWhitespace;
@property (nonatomic, assign) BOOL allowNumbers;

+ (instancetype)conditionWithNumbers:(BOOL)allowNumbers whitespace:(BOOL)allowWhiteSpace;

- (instancetype)initWithNumbers:(BOOL)allowNumbers whitespace:(BOOL)allowWhiteSpace;

@end
