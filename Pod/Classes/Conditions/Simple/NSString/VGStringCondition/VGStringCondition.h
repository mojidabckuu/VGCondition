//
//  VGStringCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGCondition.h"

@interface VGStringCondition : VGCondition

@property (nonatomic, strong) NSString *regex;

- (BOOL)checkValue:(NSString *)value;

@end
