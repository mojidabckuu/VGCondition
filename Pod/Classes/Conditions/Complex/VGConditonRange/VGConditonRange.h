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

+ (nonnull instancetype)conditionWithMin:(nullable id)min max:(nullable id)max strict:(BOOL)strict;
+ (nonnull instancetype)conditionWithMin:(nullable id)min max:(nullable id)max strict:(BOOL)strict formatter:(nonnull NSFormatter *)formatter;
+ (nonnull instancetype)conditionWithMin:(nullable id)min max:(nullable id)max strict:(BOOL)strict formatter:(nonnull NSFormatter *)formatter description:(nonnull NSString *)description;

- (nonnull instancetype)initWithMin:(nullable id)min max:(nullable id)max strict:(BOOL)strict;
- (nonnull instancetype)initWithMin:(nullable id)min max:(nullable id)max strict:(BOOL)strict formatter:(nonnull NSFormatter *)formatter;
- (nonnull instancetype)initWithMin:(nullable id)min max:(nullable id)max strict:(BOOL)strict formatter:(nonnull NSFormatter *)formatter description:(nonnull NSString *)description;

@end
