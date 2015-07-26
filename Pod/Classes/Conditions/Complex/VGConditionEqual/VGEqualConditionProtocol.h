//
//  VGEqualConditionProtocol.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import "VGConditionProtocol.h"

@protocol VGEqualConditionProtocol <VGConditionProtocol>

@required

@property (nonatomic, strong) id value;

- (instancetype)initWithValue:(id)value;

@end
