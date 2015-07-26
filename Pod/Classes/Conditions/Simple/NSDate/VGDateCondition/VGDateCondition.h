//
//  VGDateCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGCondition.h"

@interface VGDateCondition : VGCondition

- (BOOL)checkValue:(NSDate *)value;

@end
