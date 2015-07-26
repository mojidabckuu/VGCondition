//
//  VGNumberRangeCondition.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGNumberCondition.h"

#import "VGRangeConditionProtocol.h"

@interface VGNumberRangeCondition : VGNumberCondition <VGRangeConditionProtocol>

@property (nonatomic, strong) NSNumberFormatter *formatter;

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSNumberFormatter *)formatter;
- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSNumberFormatter *)formatter description:(NSString *)description;

@end
