//
//  VGConditonRange.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGComplexCondition.h"

#import "VGRangeConditionProtocol.h"

@interface VGConditonRange : VGComplexCondition <VGRangeConditionProtocol>

+ (instancetype)conditionWithMin:(id)min max:(id)max strict:(BOOL)strict;
+ (instancetype)conditionWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter;
+ (instancetype)conditionWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter description:(NSString *)description;

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict;
- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter;
- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter description:(NSString *)description;

@end
