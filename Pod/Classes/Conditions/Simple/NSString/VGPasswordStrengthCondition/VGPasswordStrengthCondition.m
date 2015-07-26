//
//  VGPasswordStrengthCondition.m
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGPasswordStrengthCondition.h"

@implementation VGPasswordStrengthCondition

#pragma mark - VGPasswordStrengthCondition lifecycle

+ (instancetype)conditionWithPasswordStrength:(VGPasswordStrength)passwordStrength {
    return [[self alloc] initWithPasswordStrength:passwordStrength];
}

- (instancetype)initWithPasswordStrength:(VGPasswordStrength)passwordStrength {
    self = [super init];
    if(self) {
        self.requiredStrength = passwordStrength;
    }
    return self;
}

#pragma mark - Validation

- (BOOL)checkValue:(NSString *)value {
    return [self _strengthOfPasswordString:value] >= _requiredStrength;
}

#pragma mark - Strength Check

- (NSUInteger)_strengthOfPasswordString:(NSString *)string
{
    
    NSUInteger strength = 0;
    
    // Run regex on string to check for matches of lowercase, uppercase, numeric and special chars
    NSUInteger numberMatchesCount = [self _numberOfNumericCharactersInString:string];
    NSUInteger lowercaseMatchesCount = [self _numberOfLowercaseCharactersInString:string];
    NSUInteger uppercaseMatchesCount = [self _numberOfUppercaseCharactersInString:string];
    NSUInteger specialCharacterMatchesCount = [self _numberOfSpecialCharactersInString:string];
    
    // For each match of each type, move the strength value up one (higher = stronger)
    if (numberMatchesCount > 0)
    {
        strength ++;
    }
    
    if (lowercaseMatchesCount > 0)
    {
        strength ++;
    }
    
    if (uppercaseMatchesCount > 0)
    {
        strength ++;
    }
    
    if (specialCharacterMatchesCount > 0)
    {
        strength ++;
    }
    
    // Move the strength up if the length is more than 8 characters and down if it is less
    if (string.length > 8)
    {
        strength ++;
    }
    else if (strength > 0)
    {
        strength --;
    }
    
    return strength;
    
}

#pragma mark - Utils

- (NSUInteger)_numberOfNumericCharactersInString:(NSString *)string
{
    return [self _numberOfMatchesWithPattern:@"\\d" inString:string];
}

- (NSUInteger)_numberOfLowercaseCharactersInString:(NSString *)string
{
    return [self _numberOfMatchesWithPattern:@"[a-z]" inString:string];
}

- (NSUInteger)_numberOfUppercaseCharactersInString:(NSString *)string
{
    return [self _numberOfMatchesWithPattern:@"[A-Z]" inString:string];
}

- (NSUInteger)_numberOfSpecialCharactersInString:(NSString *)string
{
    return [self _numberOfMatchesWithPattern:@"[^a-zA-Z\\d]" inString:string];
}

- (NSUInteger)_numberOfMatchesWithPattern:(NSString *)pattern inString:(NSString *)string
{
    NSError *error      = NULL;
    NSUInteger matches  = 0;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    if(!error)
    {
        matches =  [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    }
    
    return matches;
}

@end
