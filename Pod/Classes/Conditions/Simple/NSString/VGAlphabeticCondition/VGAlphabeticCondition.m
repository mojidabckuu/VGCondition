//
//  VGAlphabeticCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGAlphabeticCondition.h"

#define REGEX_PATTERN @"[a-zA-Z]"
#define REGEX_PATTERN_WHITESPACE @"[a-zA-Z\\s]"
#define REGEX_PATTER_NUMBERS @"[a-zA-Z0-9]"
#define REGEX_PATTER_NUMBERS_WHITESPACE @"[a-zA-Z0-9\\s]"

@implementation VGAlphabeticCondition

#pragma mark - VGAlphabeticCondition lifecycle

+ (instancetype)conditionWithNumbers:(BOOL)allowNumbers whitespace:(BOOL)allowWhiteSpace desription:(NSString *)description {
    return [[self alloc] initWithNumbers:allowNumbers whitespace:allowWhiteSpace desription:description];
}

- (instancetype)initWithNumbers:(BOOL)allowNumbers whitespace:(BOOL)allowWhiteSpace desription:(NSString *)description {
    self = [super init];
    if(self) {
        self.allowWhitespace = allowWhiteSpace;
        self.allowNumbers = allowNumbers;
    }
    return self;
}

#pragma mark - Accessors

- (NSString *)regex {
    NSString *pattern = REGEX_PATTERN;
    if(self.allowNumbers) {
        pattern = REGEX_PATTER_NUMBERS;
        if(self.allowWhitespace) {
            pattern = REGEX_PATTER_NUMBERS_WHITESPACE;
        }
    } else if (self.allowWhitespace) {
        pattern = REGEX_PATTERN_WHITESPACE;
    }
    return pattern;
}

@end
