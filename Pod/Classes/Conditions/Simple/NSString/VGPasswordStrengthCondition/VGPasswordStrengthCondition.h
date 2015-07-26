//
//  VGPasswordStrengthCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGStringCondition.h"

typedef enum {
    VGPasswordStrengthVeryWeak     = 0,
    VGPasswordStrengthWeak         = 1,
    VGPasswordStrengthMedium       = 2,
    VGPasswordStrengthStrong       = 3,
    VGPasswordStrengthVeryStrong   = 4,
} VGPasswordStrength;

@interface VGPasswordStrengthCondition : VGStringCondition

@property (nonatomic, assign) VGPasswordStrength requiredStrength;

+ (instancetype)conditionWithPasswordStrength:(VGPasswordStrength)passwordStrength;

- (instancetype)initWithPasswordStrength:(VGPasswordStrength)passwordStrength;

@end
