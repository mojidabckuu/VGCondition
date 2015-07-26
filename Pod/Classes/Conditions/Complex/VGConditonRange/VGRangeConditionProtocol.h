//
//  VGRangeConditionProtocol.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGRangeConditionProtocol.h"

@protocol VGRangeConditionProtocol <VGConditionProtocol>

@required
@property (nonatomic, assign) BOOL isStrict;
@property (nonatomic, strong) id min;
@property (nonatomic, strong) id max;
@property (nonatomic, strong) NSFormatter *formatter;

- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict;
- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter;
- (instancetype)initWithMin:(id)min max:(id)max strict:(BOOL)strict formatter:(NSFormatter *)formatter description:(NSString *)description;

@end
