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

+ (instancetype)conditionWithNumbers:(BOOL)allowNumbers whitespace:(BOOL)allowWhiteSpace {
    return [[self alloc] initWithNumbers:allowNumbers whitespace:allowWhiteSpace];
}

- (instancetype)initWithNumbers:(BOOL)allowNumbers whitespace:(BOOL)allowWhiteSpace {
    self = [super init];
    if(self) {
        self.allowWhitespace = allowWhiteSpace;
        self.allowNumbers = allowNumbers;
    }
    return self;
}

#pragma mark - Validation

- (BOOL)checkValue:(NSString *)value {
    if([super checkValue:value]) {
        NSString *pattern = REGEX_PATTERN;
        if(self.allowNumbers) {
            pattern = REGEX_PATTER_NUMBERS;
            if(self.allowWhitespace) {
                pattern = REGEX_PATTER_NUMBERS_WHITESPACE;
            }
        } else if (self.allowWhitespace) {
            pattern = REGEX_PATTERN_WHITESPACE;
        }
        
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:value options:0 range:NSMakeRange(0, value.length)];
        return numberOfMatches == value.length;
    }
    return NO;
}

@end
